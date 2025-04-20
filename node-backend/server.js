const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const { v4: uuidv4 } = require('uuid');

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

// เชื่อมต่อฐานข้อมูล MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'flutter',
  password: '123456',
  database: 'raknummallshop',
});

db.connect((err) => {
  if (err) {
    console.error('❌ ไม่สามารถเชื่อมต่อ MySQL ได้:', err);
    return;
  }
  console.log('✅ เชื่อมต่อฐานข้อมูล MySQL สำเร็จ');
});

// ------------------------------
// สมัครสมาชิกใหม่
// ------------------------------
app.post('/register', (req, res) => {
  const {
    fullname,
    email,
    password,
    phone,
    postalCode,
    idCard,
    address
  } = req.body;

  const customerid = uuidv4();

  const sql = `
    INSERT INTO customer 
    (customerid, fullname, email, password, phone, postalCode, idCard, address)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(
    sql,
    [customerid, fullname, email, password, phone, postalCode, idCard, address],
    (err, result) => {
      if (err) {
        console.error('❌ เพิ่มข้อมูลล้มเหลว:', err);
        return res.status(500).json({ error: 'ไม่สามารถสมัครสมาชิกได้', detail: err });
      }
      res.json({ success: true, message: 'สมัครสมาชิกสำเร็จ', customerid });
    }
  );
});

// ------------------------------
// เข้าสู่ระบบ
// ------------------------------
app.post('/login', (req, res) => {
  const { email, password } = req.body;

  const sql = `
    SELECT * FROM customer 
    WHERE email = ? AND password = ?
  `;

  db.query(sql, [email, password], (err, results) => {
    if (err) {
      return res.status(500).json({ success: false, error: err });
    }
    if (results.length === 1) {
      return res.json({
        success: true,
        message: "Login success",
        fullname: results[0].fullname, // ส่งกลับ fullname
      });
    } else {
      return res.json({ success: false, message: "Login failed" });
    }
  });
});

// ------------------------------
// ดึงข้อมูลสินค้า
// ------------------------------
app.get('/products', (req, res) => {
  const sql = 'SELECT * FROM products';

  db.query(sql, (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

// ------------------------------
// ดึงรีวิวตาม productId
// ------------------------------
app.get('/reviews', (req, res) => {
  const productId = req.query.productId;

  if (!productId) {
    return res.status(400).json({ error: "Missing productId" });
  }

  const sql = 'SELECT * FROM reviews WHERE product_id = ?';

  db.query(sql, [productId], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

// ------------------------------
// ดึงสินค้าที่เคยซื้อแล้วของลูกค้า
// ------------------------------
app.get('/purchases/:customerid', (req, res) => {
  const { customerid } = req.params;
  const sql = `
    SELECT p.* FROM purchase_history ph
    JOIN products p ON ph.productid = p.productid
    WHERE ph.customerid = ? AND ph.status = 'paid'
  `;
  db.query(sql, [customerid], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});


// ------------------------------
// ส่งสินค้่าเข้า history
// ------------------------------
// app.post('/record-purchase', (req, res) => {
//   const { customerid, productid, quantity } = req.body;
//   const sql = `
//     INSERT INTO purchase_history (customerid, productid, quantity, status) 
//     VALUES (?, ?, ?, 'paid')
//   `;
//   db.query(sql, [customerid, productid, quantity], (err, result) => {
//     if (err) return res.status(500).json({ error: err.message });
//     res.json({ success: true });
//   });
// });
app.post('/record-purchase', (req, res) => {
  const { customerid, productid, quantity } = req.body;

  // Debug log
  console.log("Received purchase:", req.body);

  const sql = `
    INSERT INTO purchase_history (customerid, productid, quantity, status) 
    VALUES (?, ?, ?, 'paid')
  `;
  db.query(sql, [customerid, productid, quantity], (err, result) => {
    if (err) {
      console.error("❌ Insert failed:", err);
      return res.status(500).json({ error: err.message });
    }
    res.json({ success: true });
  });
});


// app.listen(port,  () => {
//   console.log(`🚀 Server is running at http://localhost:${port}`);
// });

app.listen(port, '0.0.0.0', () => {
  console.log(`🚀 Server running at http://0.0.0.0:${port}`);
});
