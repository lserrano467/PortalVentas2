class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  # GET /features
  # GET /features.json
  def index
    ##Busco y asigno a @features los articulos que ya han sido aprobados por el administrador
    if params[:search]
      @category = Category.search(params[:search])
      @features = Feature.where(category_id: @category, publicationState: 'Aprobado') 
      if @features.empty?
        @feature = Feature.search(params[:search])
        @features = @feature.where(publicationState: 'Aprobado')
      end
    else
      @features = Feature.where(publicationState: "Aprobado")
    end
  end

  # GET /features/1
  # GET /features/1.json
  def show
    #Le asigno el id del articulo que se me envia
    @comments = Comment.where(feature_id: @feature, commentState: 'true')
  end

  # GET /features/new
  def new
    @feature = Feature.new
  end

  # GET /features/1/edit
  def edit
  end

  # POST /features
  # POST /features.json
  def create
    @feature = Feature.new(feature_params)
    ##Le asigno el id del usuario que esta logueado en ese momento
    @feature.publicationDate = Time.now
    @feature.publicationState = 'Pendiente' 
    @feature.user = User.find(session[:user_id])
    @feature.totalLikes = 0
    respond_to do |format|
      if @feature.save
        ##Despues de salvado el articulo, le asigno por defecto unos valores
        format.html { redirect_to user_path(current_user)}
        format.json { render :show, status: :created, location: @feature }
      else
        format.html { render :new }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /features/1
  # PATCH/PUT /features/1.json
  def update
    respond_to do |format|
      if @feature.update(feature_params)
        @feature.update(publicationState: 'Pendiente')
        format.html { redirect_to user_path(current_user) }
        format.json { render :show, status: :ok, location: @feature }
      else
        format.html { render :edit }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
    end
  end

  #Modifica el estado de un comentario
  def changeCommentState
    @comment = Comment.find(params[:id])
    @comment.update(commentState: 'false')
    redirect_to feature_path(@comment.feature)
  end

  #Realiza los likes
  def like
    @user = current_user
    @feature = Feature.find(params[:id])

    if @user.flagged?(@feature)
      @user.unflag(@feature)
      @totalLike = @feature.totalLikes 
      if @totalLike > 0
        @feature.update(totalLikes: @totalLike - 1)
      end
    else
      @user.flag(@feature, :like)
      @totalLike = @feature.totalLikes
      @feature.update(totalLikes: @totalLike + 1)
    end
    redirect_to feature_path(@feature)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:feature).permit(:tittle, :price, :publicationDate, :publicationState, :description, :user_id, :category_id, :image)
    end
end
