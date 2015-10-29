class Feature < ActiveRecord::Base
  #Asociaciones
	belongs_to :user
	belongs_to :category
	has_many :comment

  #like de un articulo
  make_flaggable 

  #Realiza la busqueda en la descripcion de un articulo
	def self.search(query)
    # where(:category, query) -> This would return an exact match of the query
    where("description like ?", "%#{query}%") 
  end

  #Requisitos para la imagen
  	has_attached_file :image, styles: { medium: '200x200>', thumb: '48x48>' }
  	#validates_attachment_size :image, :less_than => 2.megabytes
  	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
