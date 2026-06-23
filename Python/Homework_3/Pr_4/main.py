from utils import read_file, write_file

user_text = input("Enter your text: ")

write_file("data.txt", user_text)

content = read_file("data.txt")

if content is not None:
    print(f"File content:{content}")
