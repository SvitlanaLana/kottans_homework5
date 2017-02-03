class SessionSerializer < ActiveModel::Serializer
  attributes :id, :login, :token
end