# frozen_string_literal: true

class Transaction < ApplicationRecord
  has_one :category
  has_one :user
end
