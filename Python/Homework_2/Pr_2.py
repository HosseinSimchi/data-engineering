students = []

print("Please enter 5 student names:")
for i in range(5):
    name = input(f"Student {i+1}: ").strip()
    students.append(name)

unique_students = list(set(students))

unique_students.sort()

print("\n" + "="*40)
print("FINAL STUDENT LIST:")
print("="*40)
for index, student in enumerate(unique_students, start=1):
    print(f"{index}. {student}")
print("="*40)

print(f"\nTotal entries received: {len(students)}")
print(f"Duplicates removed: {len(students) - len(unique_students)}")
print(f"Final unique students: {len(unique_students)}")