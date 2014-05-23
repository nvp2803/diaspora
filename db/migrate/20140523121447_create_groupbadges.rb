class CreateGroupbadges < ActiveRecord::Migration
  def change
    create_table :groupbadges do |t|
      t.interger :totallike
      t.interger :totalreshare
      t.integer :loginfrequency
      t.interger :rank

      t.timestamps
    end
  end
end
