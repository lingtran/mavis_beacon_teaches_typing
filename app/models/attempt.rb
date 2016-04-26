class Attempt < ActiveRecord::Base
  belongs_to :level
  validates :text, presence: true

  def percent_correct
    point_score.round
  end

  def point_score
    score = 0
    text.chars.each_with_index do |char, index|
      score += 1 if text[index] == level.text[index]
    end
    score = (score.to_f/level.text.length) * 100

  #   attempt_text = text.chars
  #   level_text = level.text.chars
  #   comparison = (attempt_text).zip(level_text)
  #   comparison.count { |pair| pair.first == pair.last } / (level_text.length).to_f * 100
  # end
end
