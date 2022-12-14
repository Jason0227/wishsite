# frozen_string_literal: true

class AddAmountToWishlist < ActiveRecord::Migration[6.1]
  def change
    add_column :wish_lists, :amount, :integer, default: 0
  end
end
