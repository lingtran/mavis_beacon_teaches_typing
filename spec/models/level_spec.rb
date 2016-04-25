require 'rails_helper'

RSpec.describe Level, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:text) }

    it "is valid with text" do
      level = Level.new(title: "Easy", text: "Here is a typing test.")
      expect(level).to be_valid
    end

    it "is not valid with empty text" do
      level = Level.new(title: "Easy", text: "")
      expect(level).to be_invalid
    end

    it "is not valid with empty title" do
      level = Level.new(title: "", text: "Here is a typing test.")
      expect(level).to be_invalid
    end
  end

  context "associations" do
    it { should have_many(:attempts) }
  end

end
