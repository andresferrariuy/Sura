require 'spec_helper'

RSpec.describe 'These website' do
  describe 'home page' do
    before do
      visit 'https://www.these.com.uy/'
    end

    it { expect(page).to have_text 'HOME' }
    it { expect(page).to have_text 'SERVICES' }
    it { expect(page).to have_text 'ABOUT' }
    it { expect(page).to have_text 'PARTNERS' }
    it { expect(page).to have_text 'REVIEWS' }
    it { expect(page).to have_text 'TEAM' }
    it { expect(page).to have_text 'PRICE' }
    it { expect(page).to have_text 'CONTACT' }
    it { expect(page).to have_text 'GET A QUOTE' }
  end
end
