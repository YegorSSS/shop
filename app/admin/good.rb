ActiveAdmin.register Good do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params :category_id, :name, :articul, :keyword, :description, 
                :img, :anons, :content, :presence, :visible, :hits, :fresh, 
                :sale, :price, :img_slide, :views, :id, 
                goodparams_attributes: [:id, :characteristic_id, :value, :good_id, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :presence
    column :visible
    column :price
    actions
  end

  form do |f|
    f.inputs :category_id, :name, :articul, :keyword, :description, :img, :anons, :content, :presence, :visible, :hits, :fresh, :sale, :price, :img_slide, :views, :id
    f.inputs "Details" do
      f.has_many :goodparams, allow_destroy: true do |p|
        p.input :characteristic
        p.input :value
      end
    end
    f.actions
  end

end
