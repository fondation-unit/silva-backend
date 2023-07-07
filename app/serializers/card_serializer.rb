# frozen_string_literal: true

class CardSerializer
  include JSONAPI::Serializer

  attributes :name
  #attributes :medias

  attribute :medias_files do |object|
    object.medias&.map { |media| Rails.application.routes.url_helpers.url_for(media) }
  end
end

# == Schema Information
#
# Table name: cards
#
#  id            :bigint           not null, primary key
#  description   :text(65535)
#  name          :string(255)
#  note          :text(65535)
#  typeable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  typeable_id   :bigint
#
# Indexes
#
#  index_cards_on_typeable                       (typeable_type,typeable_id)
#  index_cards_on_typeable_type_and_typeable_id  (typeable_type,typeable_id) UNIQUE
#
