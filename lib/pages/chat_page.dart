import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String chatName;

  ChatPage({required this.chatName});

  @override
  Widget build(BuildContext context) {
    final messages = _getMockMessages(chatName); // ✅ ดึงข้อความ mock ตามชื่อ

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6E1E1),
        title: Text(chatName),
        leading: IconButton(
          icon: Image.asset('assets/images/back.png', width: 24, height: 24),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          return Align(
            alignment:
                msg["fromMe"] ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color:
                    msg["fromMe"]
                        ? Colors.green.shade200
                        : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(msg["text"]),
            ),
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> _getMockMessages(String name) {
    switch (name) {
      case 'SonSonSea':
        return [
          {"fromMe": false, "text": "สวัสดีค่ะ มีอะไรให้ช่วยไหมคะ"},
          {"fromMe": true, "text": "อยากดูโปรโมชั่นวันนี้ค่ะ"},
          {"fromMe": false, "text": "ลด 50% ทุกชิ้นเลยค่า!"},
        ];
      case 'NaNaWa':
        return [
          {"fromMe": true, "text": "ขอรูปสินค้าชัด ๆ ได้ไหมคะ"},
          {"fromMe": false, "text": "ได้เลยค่ะ เดี๋ยวส่งให้นะคะ"},
          {"fromMe": false, "text": "📸 รูปสินค้าเรียบร้อยค่ะ"},
        ];
      case 'NamNoN Shop':
        return [
          {"fromMe": false, "text": "แจ้งเลขพัสดุค่ะ: TH123456789"},
          {"fromMe": true, "text": "ขอบคุณค่า รอรับนะคะ"},
        ];
      case 'Koh Kood Shop':
        return [
          {"fromMe": true, "text": "โปรโมชั่นถึงเมื่อไหร่คะ"},
          {"fromMe": false, "text": "ถึงสิ้นเดือนนี้เลยค่าา"},
        ];
      default:
        return [
          {"fromMe": false, "text": "สวัสดีค่ะ"},
          {"fromMe": true, "text": "ค่ะ"},
        ];
    }
  }
}
