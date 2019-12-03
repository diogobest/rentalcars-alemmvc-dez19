require 'rails_helper'

describe CarModelPresenter do
    describe '#car_options' do
    it 'should return an array' do
      car_model = build(:car_model, car_options: 'ar,teto solar')

      result = CarModelPresenter.new(car_model.decorate).car_options

      expect(result).to match('<ul><li>ar</li><li>teto solar</li></ul>')
    end
  end
end