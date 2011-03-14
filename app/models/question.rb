class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answer_choices
  has_many :responses
  
  def next
    seq = self.survey.sequence 
    seq[seq.index(self)+1]
  end
  
  def last?
    (self.survey.sequence.last.id == self.id)
  end
  
  def process_answer_choices params
    create_answer_choices(params[:new_answer_choices])
    edit_answer_choices(params[:edit_answer_choices])    
  end
  
  def create_answer_choices answer_choices_sent
    return unless answer_choices_sent
    answer_choices_sent.each do |ac|
      self.answer_choices.build(ac)
    end
  end
  
  def edit_answer_choices answer_choices_sent
    return unless answer_choices_sent
    answer_choices_sent.each_pair do |id, ac_sent|
      ac = self.answer_choices.find_by_id(id)
      as.update_attributes(ac_sent)
    end
  end
    
end
