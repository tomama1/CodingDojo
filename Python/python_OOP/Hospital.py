class Patient(object):
    def __init__(self,id,name,allergies):
        self.id = id
        self.name = name
        self.allergies = allergies
        self.bednumber = None

class Hospital(object):
    def __init__(self,name,capacity):
        self.patients = []
        self.name = name
        self.capacity = capacity
        self.bednumbers = []
        for i in range(0,capacity):
            self.bednumbers.append(i)
            
    def admit(self,patient):
        if (len(self.patients)<self.capacity):
            self.patients.append(patient)
            for x in self.bednumbers:
                if (x!=None):
                    patient.bednumber = x
                    self.bednumbers[x] = None
                    break
            return "Admission complete"
        else:
            return "Hospital is full"
    
    def discharge(self,patient):
        for patients in self.patients:
            if (patients.id == patient.id):
                self.patients.remove(patient)
                self.bednumbers[patient.bednumber] = patient.bednumber
                patient.bednumber = None
        return self

    def showpatients(self):
        for patient in self.patients:
            print patient.id, patient.name, patient.bednumber
        return self
        

h = Hospital("La Palma",5)
p1 = Patient(100,"Matthew Toma","cucumbers")
p2 = Patient(101,"Jay Choi","chipotle")
p3 = Patient(103,"Jay3 Choi","chipotle")
p4 = Patient(104,"Jay4 Choi","chipotle")
p5 = Patient(105,"Jay5 Choi","chipotle")
p6 = Patient(102,"Ash","water")

print h.admit(p1)
print h.admit(p2)
print h.admit(p3)
print h.admit(p4)
print h.admit(p5)
print h.admit(p6)
h.showpatients()
h.discharge(p4)
print h.admit(p6)
h.showpatients()