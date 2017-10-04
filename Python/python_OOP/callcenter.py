class Call(object):
    def __init__(self,id1,name,number,time,reason):
        self.id = id1
        self.name = name
        self.number = number
        self.time = time
        self.reason = reason
    
    def display(self):
        print self.id,self.name,self.number,self.time,self.reason
        return self
    def get_time(self):
        return self.time

class CallCenter(object):
    def __init__(self,calls,qsize):
        self.calls = calls
        self.qsize = qsize
    def add(self,call):
        self.calls.append(call)
        self.qsize+=1
        return self
    def remove(self):
        self.calls.pop(0)
        self.qsize-=1
        return self
    def info(self):
        for x in self.calls:
            print x.name,x.number
        print self.qsize
        return self
    def findremove(self,number):
        for x in self.calls:
            if (x.number == number):
                print x.number,number
                self.calls.remove(x)
        return self
    def sort(self):
        self.calls.sort(key = lambda x: x.time)
        return self



c1 = Call(1,"a",1,1.01,"help")
c2 = Call(2,"b",2,1.02,"help")
c3 = Call(6,"c",6,1.05,"help")
c4 = Call(4,"d",4,1.08,"help")
c5 = Call(5,"e",5,1.03,"help")

callcenter = CallCenter([c1,c2,c3,c4],4)
# callcenter.info()
callcenter.add(c5)
# callcenter.info()
# callcenter.findremove(3)
# callcenter.info()
callcenter.sort()
callcenter.info()

