
Driver.delete_all
ParkingSpot.delete_all
Status.delete_all

dr1 = Driver.create(name: "John")
dr2 = Driver.create(name: "Bob")
dr3 = Driver.create(name: "Alex")
dr4 = Driver.create(name: "Colin")
dr5 = Driver.create(name: "Ann")


sp1 = ParkingSpot.create(available: false, time: "12.45", location: "1671 west 9th street, Brooklyn")
sp2 = ParkingSpot.create(available: true, time: "12.50", location: "1510 Coney Island avenue, Brooklyn")
sp3 = ParkingSpot.create(available: false, time: "13.03", location: "134 Bay Parkway, Brooklyn")
sp3 = ParkingSpot.create(available: false, time: "13.03", location: "1524 Gold street, Brooklyn")
sp5 = ParkingSpot.create(available: true, time: "15.45", location: "123 east 8th street, Brooklyn")
 

st1 = Status.create(parking_spot_id: sp1.id, driver_id: dr1.id)
st2 = Status.create(parking_spot_id: sp2.id, driver_id: dr2.id)
st3 = Status.create(parking_spot_id: sp3.id, driver_id: dr3.id)
#binding.pry