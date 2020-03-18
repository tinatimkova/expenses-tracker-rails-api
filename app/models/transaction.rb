# frozen_string_literal: true

class Transaction < ApplicationRecord
  # belongs_to :category
  belongs_to :user
  validates :note, :category_id, :amount, :user, :date, presence: true
end
