# 🌊 RAKNUMMALLSHOP Flutter Project

คำแนะนำการใช้งานสำหรับอาจารย์/ผู้ทดสอบโครงงานนี้เป็นระบบร้านค้า Flutter ที่เชื่อมต่อกับฐานข้อมูล MySQL ผ่าน Node.js Backend

โครงสร้างโปรเจกต์
![image](https://github.com/user-attachments/assets/6c6ef8cc-a57c-43fb-8b1e-a8f4fa5bbd10)


ขั้นตอนการใช้งานหลังจาก Clone
1. ติดตั้ง Flutter Dependencies
flutter pub get

2. ติดตั้ง Node.js และ Backend Dependencies
cd node-backend
npm install

3. เปิด Developer Mode (หากใช้ Windows)
คำสั่งใน VS Code Terminal:
start ms-settings:developers
🟨 
จากที่คุณใช้งาน Android Emulator → ไม่จำเป็นต้องเปิด Developer Mode ก็ได้
แต่ถ้า Flutter แจ้ง error ว่าต้องการ symlink แปลว่า คุณอาจเผลอรันแบบ Windows desktop อยู่

4. สร้างฐานข้อมูล MySQL
เปิด MySQL Workbench หรือ CLI แล้วรันคำสั่ง SQL ด้านล่าง 👇
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

5. เพิ่มข้อมูลสินค้าและตัวอย่างทั้งหมด
นำเข้าไฟล์ .sql หรือใช้ SQL ข้างล่างนี้ (มีในโฟลเดอร์ Database/) เพื่อเพิ่มข้อมูลสินค้า, รีวิว และตัวอย่างอื่น ๆ:
-- รันไฟล์เหล่านี้:
source raknummallshop_products.sql;
source raknummallshop_customer.sql;
source raknummallshop_purchase_history.sql;
source raknummallshop_reviews.sql;

6. สร้าง MySQL User flutter (เพื่อให้สคริปต์ backend ใช้ได้)
DROP USER IF EXISTS 'flutter'@'localhost';
CREATE USER 'flutter'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON RAKNUMMALLSHOP.* TO 'flutter'@'localhost';
FLUSH PRIVILEGES;

▶️ วิธีรันแอป
📱 ฝั่ง Frontend (Flutter)
flutter run -d emulator-5554
หรือรันผ่าน Android Emulator ที่เปิดไว้จาก Android Studio

🔙 ฝั่ง Backend (Node.js)
cd node-backend
node server.js

🔗 หมายเหตุ

🔥 Firebase ใช้ทำอะไร?
Firebase ในโปรเจกต์นี้ใช้เพื่อ แสดงให้เห็นว่าแอปสามารถเชื่อมต่อกับ Firebase ได้ โดยยัง ไม่ได้ใช้งานจริงในระบบ
จุดประสงค์คือเพื่อวางแผนสำหรับการพัฒนาฟีเจอร์ในอนาคต เช่น:

ระบบล็อกอินด้วย Firebase Authentication
เก็บข้อมูลแบบเรียลไทม์ด้วย Firestore
บันทึกภาพสินค้าไว้ใน Firebase Storage

หากไม่ต้องการใช้ Firebase ตอนนี้ สามารถลบ firebase_options.dart และคำสั่ง Firebase.initializeApp() ออกจาก main.dart ได้เลย ✅

📌 หากต้องการใช้ Firebase:
1. ติดตั้ง CLI:
flutterfire configure
2. เชื่อม Firebase Project เข้ากับ Flutter
3. เพิ่มไฟล์ google-services.json (Android) ลงในโฟลเดอร์ android/app/
4. เพิ่ม firebase_core และ dependencies อื่น ๆ ใน pubspec.yaml
5. แก้ main.dart:

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

หากใช้ Firebase จริง ควรแยก service เช่น Auth หรือ Firestore ในโฟลเดอร์ services/ ด้วย
Firebase: หากต้องการใช้ ให้เชื่อมต่อ firebase_options.dart และตั้งค่า google-services.json
หาก ไม่ใช้ Firebase ให้ลบ import และโค้ด Firebase.initializeApp() ออกจาก main.dart
