require 'rspec/rails'

describe RentalPresenter do
  describe '#status' do
    it 'should render success badge' do
      rental = build(:rental, status: :scheduled)

      result = RentalPresenter.new(rental).status

      expect(result).to eq('<span class="badge badge-primary">agendada</span>')
    end
  end
end
