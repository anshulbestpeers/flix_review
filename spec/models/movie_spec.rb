require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
  
  describe 'associations' do
    it { should have_many(:reviews) }
    it { should belong_to(:category) }
  end

  describe 'attachments' do 
    it { should have_one_attached(:main_image) }
  end
  
end 
