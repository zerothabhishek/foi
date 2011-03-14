class AddHabtmToResponses < ActiveRecord::Migration
  def self.up
    create_table :response_to_answer_choice_connection, :id => false do |t|
      t.references :response, :answer_choice
    end
  end

  def self.down
    drop_table :response_to_answer_choice_connection
  end
end
