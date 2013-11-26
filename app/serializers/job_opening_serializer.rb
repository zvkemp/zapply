class JobOpeningSerializer < ActiveModel::Serializer
  attributes :id, :title, :location, :description
end