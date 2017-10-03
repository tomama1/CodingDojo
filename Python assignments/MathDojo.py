class MathDojo(object):
    def __init__(self):
        self.val = 0
    def add(self,*nums):
        for x in nums:
            if isinstance(x,int):
                self.val = self.val+x
            else:
                self.val = self.val+sum(x)
        return self
    def subtract(self,*nums):
        for x in nums:
            if isinstance(x,int):
                self.val = self.val-x
            else:
                self.val = self.val -sum(x)
        return self
    def display_result(self):
        print self.val
        return self

md = MathDojo()
md.add([1], 3,4).add((1,2), [2,4.3,1.25]).subtract(2, [2,3], [1.1,2.3]).display_result()