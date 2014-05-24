ActiveAdmin.register Product do

  permit_params :category_id, :title, :description, :image_url, :price, :available
  index do 
    selectable_column
    id_column
    column :categorie, :category
    column :nom, :title
    column :description
    column :prix, :price do |product|
      number_to_currency product.price, :unit => "€"
    end
    column :disponible, :available do |a|
      status_tag(a.available? ? "OUI" : "NON", (a.available? :ok ))
    end
    column :créer, :created_at
    column :mis_à_jour, :updated_at
    default_actions
  end

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
