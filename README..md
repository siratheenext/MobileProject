
# 🌊 RAKNUMMALLSHOP Flutter Project

## 🧾 คำแนะนำการใช้งานสำหรับอาจารย์/ผู้ทดสอบ

โครงงานนี้เป็นระบบร้านค้า Flutter ที่เชื่อมต่อกับฐานข้อมูล MySQL ผ่าน Node.js Backend

---

## 📦 โครงสร้างโปรเจกต์

```
📁 lib/                  ← โค้ด Flutter
├── components/         ← UI component ต่าง ๆ
├── models/             ← Model class เช่น product, cart
├── pages/              ← หน้าจอทั้งหมด (login, home, cart, etc.)
├── services/           ← ฟังก์ชัน service เช่น cart, API call
├── firebase_options.dart (✅ ถ้าใช้ Firebase ให้เก็บไว้)
├── main.dart           ← จุดเริ่มต้นแอป

📁 node-backend/         ← โค้ดฝั่ง backend Node.js + Express
├── server.js
├── Database/           ← ไฟล์ SQL สำหรับ import ฐานข้อมูล
│   ├── raknummallshop_customer.sql
│   ├── raknummallshop_products.sql
│   ├── raknummallshop_purchase_history.sql
│   └── raknummallshop_reviews.sql

📄 README.md
```

---

## 🛠️ ขั้นตอนการใช้งานหลังจาก Clone

### 1. ติดตั้ง Flutter Dependencies

```
flutter pub get
```

### 2. ติดตั้ง Node.js และ Backend Dependencies

```bash
cd node-backend
npm install
```

### 3. เปิด Developer Mode (หากใช้ Windows)

- คำสั่งใน VS Code Terminal:

```bash
start ms-settings:developers
```

> ✅ ใช้เฉพาะกรณีรันบน Emulator บน Windows ไม่จำเป็นสำหรับรันบน Android Device จริง

### 4. สร้างฐานข้อมูล MySQL

1. เปิด MySQL Workbench หรือ CLI แล้วรันคำสั่ง SQL ด้านล่าง 👇

```sql
CREATE DATABASE RAKNUMMALLSHOP;
USE RAKNUMMALLSHOP;

-- ตาราง products
CREATE TABLE products (
  productid VARCHAR(36) PRIMARY KEY,
  price DOUBLE NOT NULL,
  type_product VARCHAR(50) NOT NULL,
  description_product TEXT NOT NULL,
  imageURL TEXT
);

-- ตาราง customer
CREATE TABLE customer (
  customerid VARCHAR(36) PRIMARY KEY,
  fullname VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  postalCode VARCHAR(10),
  idCard VARCHAR(20),
  address TEXT
);

-- ตาราง reviews
CREATE TABLE reviews (
  review_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id VARCHAR(36),
  username VARCHAR(100),
  comment TEXT,
  rating INT,
  date DATE
);

-- ตาราง purchase_history
CREATE TABLE purchase_history (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customerid VARCHAR(255),
  productid VARCHAR(255),
  quantity INT,
  status VARCHAR(50) DEFAULT 'paid'
);
```

### 5. เพิ่มข้อมูลสินค้าและตัวอย่างทั้งหมด

นำเข้าไฟล์ `.sql` หรือใช้ SQL ข้างในโฟลเดอร์ `Database/` ที่มีข้อมูลเต็มรูปแบบ (สินค้าทุกประเภท + รีวิวจริง):

```sql
-- รันไฟล์เหล่านี้ใน MySQL Workbench หรือ CLI:
source raknummallshop_products.sql;
source raknummallshop_customer.sql;
source raknummallshop_purchase_history.sql;
source raknummallshop_reviews.sql;
```

> ✅ หรือ copy คำสั่ง SQL ในแต่ละไฟล์แล้ววางใน MySQL Workbench ก็ได้

### 6. สร้าง MySQL User `flutter` (เพื่อให้ backend ใช้งานได้)

```sql
DROP USER IF EXISTS 'flutter'@'localhost';
CREATE USER 'flutter'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON RAKNUMMALLSHOP.* TO 'flutter'@'localhost';
FLUSH PRIVILEGES;
```

---

## ▶️ วิธีรันแอป

### 📱 ฝั่ง Frontend (Flutter)

```bash
flutter run -d emulator-5554
```

> หรือรันผ่าน Android Emulator ที่เปิดไว้จาก Android Studio

### 🔙 ฝั่ง Backend (Node.js)

```bash
cd node-backend
node server.js
```

---

## 🔗 หมายเหตุ

- **Firebase**: ในโปรเจกต์มีการ setup Firebase เพียงเพื่อแสดงให้เห็นว่าสามารถเชื่อมต่อได้ในอนาคต
  - ไม่ได้มีการใช้งาน Firebase ในโค้ดปัจจุบัน
  - หากต้องการใช้งาน Firebase จริง:
    1. ลงทะเบียน Firebase Project บน [Firebase Console](https://console.firebase.google.com)
    2. เพิ่ม `google-services.json` ไปยัง `android/app/`
    3. ตั้งค่า `firebase_options.dart` ด้วยคำสั่ง `flutterfire configure`
    4. เพิ่ม `await Firebase.initializeApp()` ที่ `main.dart`

---

## ✅ สิ่งที่ควรส่ง

**แนบไฟล์ที่ต้องส่ง:**

- โฟลเดอร์ Flutter (`lib/`, `pubspec.yaml`, etc.)
- โฟลเดอร์ Backend (`node-backend/`)
- โฟลเดอร์ `Database/` ที่รวมไฟล์ `.sql`
- README.md นี้

รันตาม README นี้แล้ว ✅ ใช้งานได้แน่นอน
