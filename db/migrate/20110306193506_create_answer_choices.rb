class CreateAnswerChoices < ActiveRecord::Migration
  def self.up
    create_table :answer_choices do |t|
      t.text :choice_text
      t.references :question

      t.timestamps
    end
  end

  def self.down
    drop_table :answer_choices
  end
end
