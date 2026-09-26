# تست دیتابیس فروشگاه با Docker Compose

## اجرا

```bash
docker compose up -d
```

اولین بار که بالا می‌آید، Postgres به‌طور خودکار فایل‌های داخل پوشه sql/ را
به ترتیب اجرا می‌کند:
  1. 01_schema.sql   -> ساخت جدول‌ها
  2. 02_data.sql     -> درج داده‌های نمونه
  3. 03_queries.sql  -> اجرای 5 کوئری تحلیلی (خروجی در لاگ چاپ می‌شود)

## دیدن خروجی کوئری‌ها (همان چیزی که موقع init چاپ شده)

```bash
docker compose logs postgres
```

در بین خطوط لاگ، نتیجه‌ی هر 5 کوئری (به ترتیب) قابل مشاهده است.

## اتصال دستی و اجرای کوئری‌های دلخواه

```bash
docker compose exec postgres psql -U postgres -d shop_db
```

داخل psql می‌توانید مثلا بزنید:
```sql
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
```

## ریست کامل (اگر خواستید از صفر دوباره init شود)

چون داده‌ها روی volume "pgdata" ذخیره می‌شوند، اسکریپت‌های init فقط بار اول
اجرا می‌شوند. برای اجرای دوباره از صفر:

```bash
docker compose down -v
docker compose up -d
```

## توقف بدون پاک کردن داده

```bash
docker compose down
```
