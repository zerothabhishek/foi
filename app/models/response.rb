class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :respondent
  has_and_belongs_to_many :answer_choices, :join_table => "response_to_answer_choice_connection"  
    
end
