class Product(object):
    def __init__(self,price,name,weight,brand,cost):
        self.price = price
        self.name = name
        self.weight = weight
        self.brand = brand
        self.cost = cost
        self.status = "for sale"
    def sell(self):
        self.status = "sold"
        return self
    def addtax(self,tax):
        newprice = self.cost*(tax+1)
        return newprice
    def returnitem(self,reason):
        if reason =="defective":
            self.price = 0
            self.status = "defective"
        elif reason =="box":
            self.status = "for sale"
        elif reason =="opened":
            self.price = self.price*0.8
            self.status = "used"
        return self
    def display_info(self):
        print self.price,self.name,self.weight,self.brand,self.cost,self.status
        return self

