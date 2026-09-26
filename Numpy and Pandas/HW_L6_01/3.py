import numpy as np

data = [
    ("Alice", 34, 70000),
    ("Bob", 45, 85000),
    ("Charlie", 25, 50000),
    ("Diana", 40, 90000),
    ("Eve", 29, 62000)
]

dtype = [("name", "U20"), ("age", "i4"), ("salary", "f8")]
employees = np.array(data, dtype=dtype)
print(employees)

older_avg_salary = employees[employees["age"] > 30]["salary"].mean()
print("میانگین حقوق سن > ۳۰:", older_avg_salary)

overall_avg_salary = employees["salary"].mean()
above_avg_names = employees[employees["salary"] > overall_avg_salary]["name"]
print("کارمندان با حقوق بالاتر از میانگین کل:", above_avg_names)

sorted_desc = np.sort(employees, order="salary")[::-1]
print("مرتب‌شده نزولی بر اساس حقوق:\n", sorted_desc)