text = input("Please enter your text: ")

words = text.split()

word_count = {}

for word in words:
    word_lower = word.lower()
    
    if word_lower in word_count:
        word_count[word_lower] += 1
    else:
        word_count[word_lower] = 1

unique_words = set(word_count.keys())

print("\n" + "="*50)
print("TEXT ANALYSIS RESULTS")
print("="*50)
print(f"Original text: {text}")
print(f"\nTotal words: {len(words)}")
print(f"Unique words: {len(unique_words)}")
print("\nWord frequency:")
print("-"*30)

for word, count in sorted(word_count.items()):
    print(f"  '{word}': {count} time(s)")

print("="*50)