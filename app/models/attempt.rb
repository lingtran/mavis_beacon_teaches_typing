class Attempt < ActiveRecord::Base
  belongs_to :level
  validates :text, presence: true

  def percent_correct
    point_score.round
  end

  def point_score
    paired_chars = (text.chars).zip(level.text.chars)
    paired_chars.count { |pair| pair.first == pair.last } / (level.text.length).to_f * 100
  end
end
