class AddHabtmToAnswerChoices < ActiveRecord::Migration
  def self.up
    create_table :answer_choice_to_response_connection, :id => false do |t|
      t.references :response, :answer_choice
    end
  end

  def self.down
    drop_table :answer_choice_to_response_connection
  end
end
