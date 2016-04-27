class Attempt < ActiveRecord::Base
  belongs_to :level
  validates :text, presence: true

  def percent_correct
    (point_score * 100).round
  end

  def point_score
    paired_chars = (text.chars).zip(level.text.chars)
    paired_chars.count { |pair| pair.first == pair.last } / (level.text.length).to_f
  end
end
