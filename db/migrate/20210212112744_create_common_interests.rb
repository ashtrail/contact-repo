class CreateCommonInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :common_interests do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :contacts, :common_interests do |t|
      t.index [:contact_id, :common_interest_id],
        name: 'index_common_interests_contacts_link'
    end
  end
end
