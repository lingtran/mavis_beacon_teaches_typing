class Attempt < ActiveRecord::Base
  belongs_to :level
  validates :text, presence: true

  def percent_correct
    point_score.round
  end

  def point_score
    score = 0
    level.text.chars.each_with_index do |char, index|
      score += 1 if text[index] == level.text[index]
    end
    score = (score.to_f/level.text.length) * 100
  end
end
