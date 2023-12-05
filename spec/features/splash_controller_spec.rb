# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'splash page', type: :feature do
  context 'when users is not logged in to the system' do
    it 'displays the name of the app' do
      visit unauthenticated_root_path

      expect(page).to have_content('Budget Tracker')
    end
  end
end
