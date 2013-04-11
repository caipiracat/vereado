class CreateExpense < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
     t.string :description
     t.int :year
     t.float :jan
     t.float :fev
     t.float :mar
     t.float :abr
     t.float :mai
     t.float :jun
     t.float :jul
     t.float :ago
     t.float :set
     t.float :out
     t.float :nov
     t.float :dez
     t.integer :user_id
     t.timestamps
    end
  end
end