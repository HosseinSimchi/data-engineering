import numpy as np
import pandas as pd

sales = np.array([
    [120, 135, 150, 160, 145, 170, 180],
    [130, 140, 155, 165, 150, 175, 190]
])
days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

df = pd.DataFrame(sales, index=["Week1", "Week2"], columns=days)
print(df)

weekly_total = df.sum(axis=1)
print("مجموع فروش هر هفته:\n", weekly_total)

daily_total = df.sum(axis=0)
print("مجموع فروش هر روز:\n", daily_total)

best_day = daily_total.idxmax()
print("روز با بیشترین فروش کل:", best_day, "با مقدار", daily_total.max())

overall_mean = df.values.mean()
above_avg_days = daily_total[daily_total > overall_mean]
print("روزهای بالاتر از میانگین کل:\n", above_avg_days)