# frozen_string_literal: true

# Create Comments Table
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, &:timestamps
  end
end
