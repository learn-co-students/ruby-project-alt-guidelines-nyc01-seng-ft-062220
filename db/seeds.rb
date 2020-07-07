require 'pry'

Guest.delete_all
Restaurant.delete_all
Reservation.delete_all


g1 = Guest.create(first_name: "Bill", last_name:'Gates', phone_number: 2128675309, guest_notes: "Likes expensive wine")
g2 = Guest.create(first_name: "Steve", last_name:'Jobs', phone_number: 2125551234, guest_notes: "Likes Apple Pie")

rest1 = Restaurant.create(name: 'ilili')

reso1 = Reservation.create(date: '8/12/2020', time:"6PM", party_size: 4, reservation_notes: 'Running Late', guest_id: g1.id, restaurant_id: rest1.id)
