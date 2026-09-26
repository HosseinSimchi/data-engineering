import pandas as pd

data = {
    "student": ["A", "B", "C", "D", "E"],
    "math": [90, 85, None, 70, 88],
    "physics": [None, 80, 78, 65, 92],
    "chemistry": [85, None, 82, 60, None]
}
df = pd.DataFrame(data)

missing_counts = df.isnull().sum()
print("تعداد مقادیر گمشده در هر ستون:\n", missing_counts)

numeric_cols = ["math", "physics", "chemistry"]
df[numeric_cols] = df[numeric_cols].fillna(df[numeric_cols].mean())
print(df)

df["average"] = df[numeric_cols].mean(axis=1)
print(df)

best_student = df.loc[df["average"].idxmax(), "student"]
print("دانشجو با بیشترین میانگین:", best_student)