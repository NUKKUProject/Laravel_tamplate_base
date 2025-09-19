ไฟล์ Base Laravel + Postgres SQL + pdAdmin4 for web ยังไม่มี Admin tamplate
1. เปลี่ยนขื่อไฟล์  .env.example ใน webroot เป็น .env
2. แก้ไขการเชื่อมต่อฐานข้อมูล ใน webroot/.env
    DB_CONNECTION=pgsql
    DB_HOST=postgresDB
    DB_PORT=5432
    DB_DATABASE=laravel
    DB_USERNAME=user ในการเข้าถึงฐานข้อมูล  ## กำหนดตรงนี้
    DB_PASSWORD=รหัสเข้าถึงฐานข้อมูล  ## ต้องกำหนด ต้องมีรหัส ไม่งั้นจะรันไม่ผ่าน
3. แก้ไข .env ด้านนอกสุด
    POSTGRES_USER= จะต้องตรงกันกับ DB_USERNAME 
    POSTGRES_PASSWORD=จะต้องตรงกันกับ DB_PASSWORD 
    POSTGRES_DB=laravel
   
    PGADMIN_DEFAULT_EMAIL=ระบุ email ที่จะเข้า pgAdmin
    PGADMIN_DEFAULT_PASSWORD= รหัสผ่านเข้าถึง pgAdmin


หากใช้ widows เปิดใน Git Bash หรือ WSL แล้วรันคำสั่ง bash ./setup_frist.sh
Lunix = ./setup_frist.sh
