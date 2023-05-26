# frozen_string_literal: true

# Create User Table
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, &:timestamps
  end
end
