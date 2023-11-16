require 'rails_helper'

RSpec.describe WeatherPresenter, type: :presenter do
  let(:data) do
    {
      'current' => {
        'condition' => {
          'text' => 'Sunny',
          'icon' => 'icon_url'
        },
        'temp_c' => 20
      },
      'location' => {
        'name' => 'Warsaw'
      }
    }
  end
  let(:presenter) { described_class.new(data) }

  describe '#encourage_text' do
    context 'when the weather is nice and temperature is above 15' do
      it 'returns a message to read a book in a park' do
        expect(presenter.encourage_text).to eq('Get some snacks and go read a book in a park!')
      end
    end

    context 'when the weather is not nice or temperature is below 15' do
      before do
        data['current']['condition']['text'] = 'Rainy'
        data['current']['temp_c'] = 10
      end

      it 'returns a message to read a book' do
        expect(presenter.encourage_text).to eq("It's always a good weather to read a book!")
      end
    end
  end

  describe '#description' do
    it 'returns the weather description' do
      expect(presenter.description).to eq('Sunny')
    end
  end

  describe '#temperature' do
    it 'returns the current temperature' do
      expect(presenter.temperature).to eq(20)
    end
  end

  describe '#icon' do
    it 'returns the weather icon url' do
      expect(presenter.icon).to eq('icon_url')
    end
  end

  describe '#location' do
    it 'returns the location name' do
      expect(presenter.location).to eq('Warsaw')
    end
  end
end
