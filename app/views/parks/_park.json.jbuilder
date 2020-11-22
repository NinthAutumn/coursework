json.extract! park, :id, :name, :description, :cover, :images, :avatar, :address_line_1, :address_line_2, :post_code, :created_at, :updated_at
json.url park_url(park, format: :json)
