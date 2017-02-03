class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :login, :token, :description, :created_at
end