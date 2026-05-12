students_grades = {}

for i in range(3):
    name = input(f"Enter name of student {i+1}: ").strip().lower()
    grade = float(input(f"Enter grade for {name}: "))
    students_grades[name] = grade
    print()

grades_list = list(students_grades.values())
average_grade = sum(grades_list) / len(grades_list)

print("="*40)
print(f"Average Score: {average_grade:.2f}")
print("="*40)
for name, grade in students_grades.items():
    status = "✅ Passed" if grade > 10 else "❌ Failed"
    print(f"{name.title()}: {grade} - {status}")
