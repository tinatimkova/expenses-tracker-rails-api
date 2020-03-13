# frozen_string_literal: true

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :transactions

  def editable
    scope == object.user
  end
end
