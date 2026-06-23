from models.student import Student
from utils.file_manager import save_students, load_students

students = []

for i in range(3):
    print(f"\nStudent {i + 1}")

    name = input("Enter name: ")
    grade = input("Enter grade: ")

    students.append(Student(name, grade))

save_students("students.txt", students)

loaded_students = load_students("students.txt")

print("\nStored Students:")
for student in loaded_students:
    print(student.info())