ไฟล์ Base Laravel + Postgres SQL + pdAdmin4 for web ยังไม่มี Admin tamplate<br>
1. เปลี่ยนขื่อไฟล์  .env.example ใน webroot เป็น .env<br>
2. แก้ไขการเชื่อมต่อฐานข้อมูล ใน webroot/.env <br>
    DB_CONNECTION=pgsql<br>
    DB_HOST=postgresDB<br>
    DB_PORT=5432<br>
    DB_DATABASE=laravel<br>
    DB_USERNAME=user ในการเข้าถึงฐานข้อมูล  ## กำหนดตรงนี้<br>
    DB_PASSWORD=รหัสเข้าถึงฐานข้อมูล  ## ต้องกำหนด ต้องมีรหัส ไม่งั้นจะรันไม่ผ่าน<br>
3. แก้ไข .env ด้านนอกสุด<br>
    POSTGRES_USER= จะต้องตรงกันกับ DB_USERNAME <br>
    POSTGRES_PASSWORD=จะต้องตรงกันกับ DB_PASSWORD <br>
    POSTGRES_DB=laravel<br><br>
   
    PGADMIN_DEFAULT_EMAIL=ระบุ email ที่จะเข้า pgAdmin<br>
    PGADMIN_DEFAULT_PASSWORD= รหัสผ่านเข้าถึง pgAdmin<br>


หากใช้ widows เปิดใน Git Bash หรือ WSL แล้วรันคำสั่ง bash ./setup_frist.sh<br>
Lunix = ./setup_frist.sh
