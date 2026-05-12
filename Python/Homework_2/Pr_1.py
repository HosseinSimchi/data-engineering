sentence = input("Please enter a sentence: ")

char_count = len(sentence)

word_count = len(sentence.split())

uppercase_sentence = sentence.upper()

lowercase_sentence = sentence.lower()

has_python = "python" in lowercase_sentence


print("="*40)
print(f"Number of characters: {char_count}")
print(f"Number of words: {word_count}")
print(f"Uppercase: {uppercase_sentence}")
print(f"Lowercase: {lowercase_sentence}")
print(f"Contains 'python': {has_python}")
print("="*40)