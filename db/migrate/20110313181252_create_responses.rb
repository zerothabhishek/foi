class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.references :question
      t.references :respondent
      t.text :value

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
