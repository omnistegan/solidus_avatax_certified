require 'spec_helper'

describe Spree::Adjustment, type: :model do
  describe 'not_tax' do
    it 'does not include adjustments with source_type of Spree::TaxRate' do
      tax_adjustment = create(:adjustment, source_type: 'Spree::TaxRate')
      non_tax_adjustment = create(:adjustment, source_type: 'Spree::Promotion')

      expect(Spree::Adjustment.not_tax).to_not include(tax_adjustment)
      expect(Spree::Adjustment.not_tax).to include(non_tax_adjustment)
    end
  end

  describe '#avatax_cache_key' do
    it 'should respond with a cache key' do
      adjustment = create(:adjustment, id: 1, amount: 20.0)

      expected_response = 'Spree::Adjustment-1-20.0'

      expect(adjustment.avatax_cache_key).to eq(expected_response)
    end
  end
end
