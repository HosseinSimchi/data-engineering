import numpy as np

temps = np.array([22, 25, 19, 30, 28, 31, 24, 18, 35, 27], dtype=float)

mask_hot = temps > 28
print("ماسک:", mask_hot)

hot_days = temps[mask_hot]
print("دماهای بیشتر از ۲۸:", hot_days)

temps[temps < 20] = np.nan
print("دماها پس از جایگزینی:", temps)

avg_temp = np.nanmean(temps)
print("میانگین دما (بدون NaN):", avg_temp)