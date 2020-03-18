# frozen_string_literal: true

class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date, :note, :editable

  def editable
    scope == object.user
  end
end
