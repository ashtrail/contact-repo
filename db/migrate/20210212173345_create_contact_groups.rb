class CreateContactGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_groups do |t|
      t.string :name
      t.date :last_contact

      t.timestamps
    end

    create_join_table :contacts, :contact_groups do |t|
      t.index %i[contact_id contact_group_id],
              name: 'index_contact_groups_contacts_link'
    end
  end
end
