ActiveAdmin.register Category do


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
  permit_params :title, :keyword, :description, :content, :img, :parent_id

  index do
    selectable_column
    id_column
    column :title
    #column :keyword
    #column :description
    #column :content
    #column :img
    column :parent_id
    #column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :title
      f.input :keyword
      f.input :description
      f.input :content
      f.input :img
      f.input :parent_id
    end
    f.actions
  end

end
