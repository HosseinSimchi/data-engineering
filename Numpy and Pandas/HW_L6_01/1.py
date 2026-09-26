import numpy as np

scores = np.array([
    [78, 85, 90, 88],
    [92, 81, 76, 95],
    [89, 90, 91, 87],
    [65, 70, 72, 68],
    [99, 95, 98, 100]
])

student_avg = scores.mean(axis=1)
print("میانگین هر دانشجو:", student_avg)

exam_avg = scores.mean(axis=0)
print("میانگین هر امتحان:", exam_avg)

centered = scores - exam_avg 
print("نمرات پس از کم کردن میانگین ستون:\n", centered)

best_student = np.argmax(student_avg)
print("شماره دانشجو با بیشترین میانگین:", best_student, "با میانگین", student_avg[best_student])