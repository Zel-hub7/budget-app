# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'payment relations' do
    it 'should belong to item class' do
      expect(Payment.reflect_on_association(:item).macro).to eq(:belongs_to)
    end

    it 'should belong to category class' do
      expect(Payment.reflect_on_association(:category).macro).to eq(:belongs_to)
    end
  end
end
