class Bike(object):
    def __init__(self, price, max_speed):
        self.price = price
        self.max_speed = max_speed
        self.miles = 0

    def displayInfo(self):
        print self.price, self.max_speed, self.miles

    def ride(self):
        print "Riding"
        self.miles+=10
        return self

    def reverse(self):
        print "Reversing"
        self.miles-=5
        return self

bike1 = Bike("$500","400mph")
bike2 = Bike("$1","50mph")
bike1.ride()
bike1.ride()
bike1.ride()
bike1.reverse()
bike1.displayInfo()

bike2.ride()
bike2.ride()
bike2.reverse()
bike2.reverse()
bike2.displayInfo()