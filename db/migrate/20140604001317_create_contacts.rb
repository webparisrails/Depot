class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :nom
      t.string :email
      t.string :sujet
      t.text :message

      t.timestamps
    end
  end
end
