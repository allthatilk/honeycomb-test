#!/usr/bin/env ruby

require './models/broadcaster'
require './models/delivery'
require './models/material'
require './models/order'
require './models/special_offer'

standard_delivery = Delivery.new(:standard, 10.0)
express_delivery = Delivery.new(:express, 20.0)

broadcaster_1 = Broadcaster.new(1, 'Viacom')
broadcaster_2 = Broadcaster.new(2, 'Disney')
broadcaster_3 = Broadcaster.new(3, 'Discovery')
broadcaster_4 = Broadcaster.new(4, 'ITV')
broadcaster_5 = Broadcaster.new(5, 'Channel 4')
broadcaster_6 = Broadcaster.new(6, 'Bike Channel')
broadcaster_7 = Broadcaster.new(7, 'Horse and Country')

material = Material.new('WNP/SWCL001/010')
order = Order.new(material)

order.add broadcaster_1, standard_delivery
order.add broadcaster_2, standard_delivery
order.add broadcaster_3, express_delivery

special_offer = SpecialOffer.new(order)
special_offer.calculate_discount(2, 5, 30, 0.9)
order.check_offers(special_offer.total_discount)

print order.output
print "\n"
