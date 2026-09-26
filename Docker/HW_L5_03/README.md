# سیستم انبارداری — راهنمای اجرا

## بالا آوردن دیتابیس

```bash
docker compose up -d
```

اولین باری که کانتینر بالا می‌آید، `schema.sql` و سپس `seed_data.sql` به‌صورت خودکار
روی دیتابیس `warehouse_db` اجرا می‌شوند (چون در `docker-entrypoint-initdb.d` مونت شده‌اند).

اگر بعداً بخواهید اسکیما را از نو بسازید (مثلاً بعد از تغییر فایل‌ها):

```bash
docker compose down -v   # حذف volume دیتا برای اجرای دوباره‌ی init scripts
docker compose up -d
```

## اجرای کوئری‌های تحلیلی

```bash
docker compose exec -T db mysql -uwarehouse_user -pwarehouse_pass warehouse_db < queries_analysis.sql
```

یا برای ورود تعاملی به دیتابیس:

```bash
docker compose exec db mysql -uwarehouse_user -pwarehouse_pass warehouse_db
```

## ساختار پروژه

- `docker-compose.yml` — سرویس MySQL 8
- `schema.sql` — طراحی جداول (بخش ۱)
- `seed_data.sql` — داده‌های نمونه برای تست
- `queries_analysis.sql` — چهار کوئری تحلیلی (بخش ۲)
