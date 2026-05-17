class Animal:

  def sound(self):
    return "Animals make sounds"

class Dog(Animal):

  def sound(self):
    return 'Woof Woof !'

animal_1 = Animal()
dog_1 = Dog()

print(f"An instance of Animal class --> {animal_1.sound()}")
print(f"An instance of Dog class --> {dog_1.sound()}")