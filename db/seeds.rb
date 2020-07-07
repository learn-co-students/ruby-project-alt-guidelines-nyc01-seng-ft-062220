Client.destroy_all
Dealership.destroy_all
Review.destroy_all

c1 = Client.create(name: "Mike", email: "mike@email.com", phone: 555-6789)
c2 = Client.create(name: "Jill", email: "Jill@email.com", phone: 555-1234)
c3 = Client.create(name: "John", email: "john@email.com", phone: 555-4432)

d1 = Dealership.create(name: "Bob's Ford", brand: "Ford", location: "Brooklyn, NY", phone: 123-6789)
d2 = Dealership.create(name: "Route 22 Toyota", brand: "Toyota", location: "Parsippany, NJ", phone: 534-4455)
d3 = Dealership.create(name: "Brooklyn Nissan", brand: "Nissan", location: "Brooklyn, NY", phone: 456-6789)

r1 = Review.create(text_body: "Great place, would shop again.", rating: 4.5, dealership: d1, client: c1)
r2 = Review.create(text_body: "Horrible!! Never coming here again!", rating: 1, dealership: d1, client: c2)
r3 = Review.create(text_body: "Could be better", rating: 2.5, dealership: d2, client: c3)
r4 = Review.create(text_body: "Sunshine and roses", rating: 5, dealership: d2, client: c1)
r5 = Review.create(text_body: "Did the right thing", rating: 4, dealership: d1, client: c3)