class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :password
      t.string :email
      t.integer :user_type
      t.string :inter
      t.string :date
      t.integer :first
      t.integer :second
      t.integer :third
      t.timestamps
    end
  end
end
