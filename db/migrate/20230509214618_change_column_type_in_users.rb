# frozen_string_literal: true

class ChangeColumnTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :bio, :text
  end
end
