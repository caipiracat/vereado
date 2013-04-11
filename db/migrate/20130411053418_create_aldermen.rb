class CreateAldermen < ActiveRecord::Migration
  def change
    create_table :aldermen do |t|
      t.string :name
      t.string :political_party
      t.integer :cpi
      t.integer :ind
      t.integer :moc
      t.integer :pdl
      t.integer :pelom
      t.integer :plo
      t.integer :pre
      t.integer :req
      t.integer :total

      t.timestamps
    end
  end
end
