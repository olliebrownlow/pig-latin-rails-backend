class CreateTerminologies < ActiveRecord::Migration[6.0]
  def change
    create_table :terminologies do |t|
      t.string :english
      t.string :pig_latin

      t.timestamps
    end
  end
end
