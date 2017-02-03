class ObservationSerializer < ActiveModel::Serializer
  attributes :created_at, :temp, :humidity, :temp_min, :temp_max

end