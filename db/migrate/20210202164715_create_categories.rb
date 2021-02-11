class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    add_reference :contacts, :category, foreign_key: true
  end
end
