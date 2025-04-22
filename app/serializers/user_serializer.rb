class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :favorite_city
end
