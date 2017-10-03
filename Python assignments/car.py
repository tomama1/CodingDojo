class Car(object):
    def __init__(self,price,speed,fuel,mileage):
        self.price = price
        self.speed = speed 
        self.fuel = fuel 
        self.mileage = mileage
        if (self.price > 10000):
            self.tax = 0.15
        else:
            self.tax = 0.12

    def display_all(self):
        display_price = "Price: "+self.price+"\n"
        display_speed = "Speed: "+self.speed+"\n"
        display_fuel = "Fuel: "+self.fuel+"\n"
        display_mileage = "Mileage: "+self.mileage+"\n"
        display_tax = "Tax: "+str(self.tax)+"\n"
        return display_price+display_speed+display_fuel+display_mileage+display_tax


car1 = Car("2000","35mph","Full","15mph")
car2 = Car("2000","5mph","Not Full","105mph")
car3 = Car("2000","15mph","Kind of Full","95mph")
car4 = Car("2000","25mph","Full","25mph")
car5 = Car("20000000","35mph","Empty","15mph")
car6 = Car("2000","25mph","Empty","25mph")
print car1.display_all()
print car2.display_all()
print car3.display_all()
print car4.display_all()
print car5.display_all()
print car6.display_all()
