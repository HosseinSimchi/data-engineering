class Student: 
  def __init__(self, name, grade):
    self.name = name 
    self.grade = grade

  def info(self):
    return f"Student: {self.name} - Grade: {self.grade}"