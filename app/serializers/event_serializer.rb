class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :description

  belongs_to :user

  def created_at
    object.created_at.strftime('%Y-%B-%d')
  end
end
