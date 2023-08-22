json.extract! profile, :id, :name, :data, :telefone, :email, :created_at, :updated_at
json.url profile_url(profile, format: :json)
