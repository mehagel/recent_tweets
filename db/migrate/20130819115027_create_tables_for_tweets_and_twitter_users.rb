class CreateTablesForTweetsAndTwitterUsers < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :twitter_user
      t.string :text

      t.timestamps
    end

    create_table :twitter_users do |t|
      t.string :username
    
      t.timestamps
    end

  end
end
