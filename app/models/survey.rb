class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  
  def sequence
    @sequence = @sequence || generate_sequence
  end
  
  def generate_sequence
    self.questions.order("created_at")
  end
  
end
