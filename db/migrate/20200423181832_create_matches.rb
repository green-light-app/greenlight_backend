class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references user, index: true, foreign_key: true
      t.references match, index: true
      t.boolean confirmed
      t.timestamps
    end
    add_foreign_key :matches, :users, column: :match_id
  end
end
