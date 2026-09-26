import pandas as pd

data = {
    "product": ["A", "B", "C", "A", "B", "C"],
    "store": ["X", "X", "X", "Y", "Y", "Y"],
    "sales": [120, 150, 90, 200, 130, 160]
}
df = pd.DataFrame(data)

total_per_product = df.groupby("product")["sales"].sum()
print("مجموع فروش هر محصول:\n", total_per_product)

avg_per_store = df.groupby("store")["sales"].mean()
print("میانگین فروش هر فروشگاه:\n", avg_per_store)

high_sales = df[df["sales"] > 140]
print("فروش‌های بیشتر از ۱۴۰:\n", high_sales)

df["sales_normalized"] = df["sales"] / df["sales"].max()
print(df)