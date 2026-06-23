from models.student import Student


def save_students(path, students):
    try:
        with open(path, "w", encoding="utf-8") as file:
            for student in students:
                file.write(f"{student.name},{student.grade}\n")
    except PermissionError:
        print("Error Occured!, Access Denied")


def load_students(path):
    students = []

    try:
        with open(path, "r", encoding="utf-8") as file:
            for line in file:
                name, grade = line.strip().split(",")
                students.append(Student(name, grade))
    except FileNotFoundError:
        return []

    return students