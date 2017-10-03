class Animal(object):
    def __init__(self,name,health):
        self.name = name
        self.health = health
    
    def walk(self):
        self.health-=1
        return self
    
    def run(self):
        self.health-=5
        return self
    
    def display_health(self):
        print self.health
        return self

class Dog(Animal):
    def __init__(self,name,health):
        super(Dog,self).__init__(name,health)
        self.health=150

    def pet(self):
        self.health+=5
        return self

    def display_health(self):
        super(Dog, self).display_health()
        return self

class Dragon(Animal):
    def __init__(self,name,health):
        super(Dragon,self).__init__(name,health)
        self.health=170

    def fly(self):
        self.health-=10
        return self
    
    def display_health(self):
        super(Dragon, self).display_health()
        print "I am a Dragon"
        return self

a = Animal("boe",40)
a.walk().walk().walk().run().run().display_health()

d = Dog("Chi",0)
d.walk().walk().walk().run().run().pet().display_health()
#d.fly()

dragon1 = Dragon("bob",15)
dragon1.display_health()

