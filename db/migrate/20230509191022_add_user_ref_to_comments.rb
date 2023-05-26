# frozen_string_literal: true

# Add Foreign Key
class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
  end
end
