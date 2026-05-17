def add(a: int, b: int):
  return a + b

def subtract(a:int, b:int):
  return a - b

number_1 = int(input("Enter number1: "))
number_2 = int(input("Enter number2: "))

print(f"sum: {add(number_1, number_2)}")
print(f"Subtraction: {subtract(number_1, number_2)}")