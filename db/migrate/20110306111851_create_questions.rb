class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :q_text
      t.integer :ans_type
      t.references :survey

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
