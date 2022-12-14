# frozen_string_literal: true

class CreateWishLists < ActiveRecord::Migration[6.1]
  def change
    create_table :wish_lists do |t|
      t.string :title
      t.text :description

      t.timestamps
      # created_at
      # updated_at
    end
  end
end
