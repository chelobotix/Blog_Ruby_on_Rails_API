# frozen_string_literal: true

# Add columns to table
class AddColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :text, :string
  end
end
