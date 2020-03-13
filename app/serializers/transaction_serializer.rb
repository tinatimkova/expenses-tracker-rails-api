# frozen_string_literal: true

class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date, :note

  belongs_to :category

  def editable
    scope == object.user
  end
end
