require 'pry'

Guest.delete_all
Restaurant.delete_all
Reservation.delete_all


g1 = Guest.create(first_name: "Bill", last_name:'Gates', phone_number: 2128675309, guest_notes: "Likes expensive wine")
g2 = Guest.create(first_name: "Steve", last_name:'Jobs', phone_number: 2121112222, guest_notes: "Likes Apple Pie     ")

rest1 = Restaurant.create(name: 'ilili')
rest2 = Restaurant.create(name: 'Tribeca Grill')
rest3 = Restaurant.create(name: 'Per Se')

reso1 = Reservation.create(date: '8/12/2020', time:"6PM", party_size: 4, reservation_notes: 'Running Late', guest: g1, restaurant: rest1)
reso2 = Reservation.create(date: '8/13/2020', time:"7PM", party_size: 2, reservation_notes: 'Birthday Dinner', guest: g1, restaurant: rest2)
reso3 = Reservation.create(date: '8/14/2020', time:"7PM", party_size: 2, reservation_notes: 'Anniversary Dinner', guest: g1, restaurant: rest3)
reso4 = Reservation.create(date: '8/15/2020', time:"5PM", party_size: 6, reservation_notes: 'Anniversary Dinner', guest: g2, restaurant: rest1)