# frozen_string_literal: true

class ChangeColumnTypeInComments < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :text, :text
  end
end
