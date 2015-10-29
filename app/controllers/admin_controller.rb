class AdminController < ApplicationController
  def index
  	@features = Feature.all
  	@users = User.all
    @category = Category.all
  end

  ##Procedimiento que cambia el estado de una publicacion
  def acceptFeature
    @feature = Feature.find(params[:id])
    if @feature.publicationState == "Pendiente" || @feature.publicationState == "Rechazado"
      @feature.update(publicationState: 'Aprobado')
      redirect_to admin_index_path
    else
      @feature.update(publicationState: 'Pendiente')
      redirect_to admin_index_path
    end
  end

  ##Modifica el tipo de Usuario
  def updateUserType
    @user = User.find(params[:id])
    if @user.userType == "Usuario"
      @user.update(userType: 'Administrador')
      redirect_to admin_index_path
    else
      @user.update(userType: 'Usuario')
      redirect_to admin_index_path
    end
  end

    ##Procedimiento que cambia el estado de una publicacion
  def acceptCategory
    @category = Category.find(params[:id])
    if @category.categoryState == "Pendiente"
      @category.update(categoryState: 'Aprobado')
      redirect_to admin_index_path
    else
      @category.update(categoryState: 'Pendiente')
      redirect_to admin_index_path
    end
  end

end
