require './models/broadcaster'
require './models/delivery'
require './models/material'
require './models/order'
require './models/special_offer'

describe Order do
  subject { Order.new(material) }
  let(:material) { Material.new 'HON/TEST001/010' }
  let(:standard_delivery) { Delivery.new(:standard, 10) }
  let(:express_delivery) { Delivery.new(:express, 20) }

  context 'empty' do
    it 'costs nothing' do
      expect(subject.total_cost).to eq(0)
    end
  end

  context 'with items' do
    let(:special_offer) {SpecialOffer.new(subject)}
    broadcaster_1 = Broadcaster.new(1, 'Viacom')
    broadcaster_2 = Broadcaster.new(2, 'Disney')
    broadcaster_3 = Broadcaster.new(3, 'Discovery')
    broadcaster_4 = Broadcaster.new(4, 'Horse and Country')

    it 'returns the total cost of all items' do
      subject.add broadcaster_1, standard_delivery
      subject.add broadcaster_2, express_delivery

      expect(subject.total_cost).to eq(30)
    end

    it 'subtracts the current percent discount from qualifying order' do
      subject.add broadcaster_1, standard_delivery
      subject.add broadcaster_2, standard_delivery
      subject.add broadcaster_3, standard_delivery
      subject.add broadcaster_4, express_delivery

      special_offer.calculate_discount(0, 0, 30, 0.9)

      expect(subject.total_cost - special_offer.total_discount).to eq(45)
    end

    it 'subtracts the current set delivery discount from qualifying order' do
      subject.add broadcaster_1, express_delivery
      subject.add broadcaster_2, express_delivery
      subject.add broadcaster_3, express_delivery

      special_offer.calculate_discount(2, 5, 30, 0.9)

      expect(subject.total_cost - special_offer.total_discount).to eq(40.5)
    end
  end
end
