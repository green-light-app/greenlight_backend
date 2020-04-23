class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references user, index: true, foreign_key: true
      t.references crush, index: true
      t.boolean confirmed
      t.timestamps
    end
    add_foreign_key :matches, :users, column: :crush_id
  end
end
