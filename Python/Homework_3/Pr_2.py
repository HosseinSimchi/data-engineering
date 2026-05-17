class Person:
  def __init__(self, name, age):
    self.name = name
    self.age = age

  def introduce(self):
    return f"Hello my name is {self.name} and I am {self.age} years old"
  
hossein = Person("Hossein Simchi", 30)

print(hossein.introduce())