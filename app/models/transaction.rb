# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :category
  has_one :user
end
