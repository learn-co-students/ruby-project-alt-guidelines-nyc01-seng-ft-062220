dr1 = Driver.new("John", "BMW")
dr2 = Driver.new("Bob", "Audi")
dr3 = DRiver.new("Alex", "Jeep")


sp1 = ParkingSpot.new("loc1", "avail")
sp2 = ParkingSpot.new("loc2", "avail")
sp3 = ParkingSpot.new("loc3", "un")
 

st1 = Status.new(sp1, dr1)
st2 = Status.new(sp2, dr2)
st3 = Status.new(sp3, dr3)