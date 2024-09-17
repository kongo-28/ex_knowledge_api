class CreateKnowledges < ActiveRecord::Migration[7.0]
  def change
    create_table :knowledges do |t|
      t.string :title
      t.text :content
      t.integer :condition

      t.timestamps
    end
  end
end
