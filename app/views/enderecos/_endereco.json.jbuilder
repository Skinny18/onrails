json.extract! endereco, :id, :cep, :bairro, :cidade, :estado, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
