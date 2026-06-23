import re

text = "Ali bought 3 books, 12 Pens and 5 notebooks in 2023"

numbers = re.findall(r'\d+', text)

capital_words = re.findall(r'\b[A-Z][a-zA-Z]*\b', text)

print("Numbers:", numbers)
print("Count of numbers:", len(numbers))

print("Capital words:", capital_words)
print("Count of capital words:", len(capital_words))