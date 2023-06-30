# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :email, :firstname, :lastname, :created_at, :admin

  attribute :created_date do |user|
    user.created_at && user.created_at.strftime('%d/%m/%Y')
  end  
end
