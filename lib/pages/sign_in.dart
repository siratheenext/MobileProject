import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = true;

  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final zipController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final idCardController = TextEditingController();

  LatLng selectedLocation = LatLng(13.736717, 100.523186);
  String addressText = "ยังไม่ได้เลือกตำแหน่ง";

  Future<void> _updateAddressFromLatLng(LatLng latlng) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        latlng.latitude,
        latlng.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          addressText =
              '${place.name ?? ''}, ${place.street ?? ''}, ${place.subLocality ?? ''}, ${place.locality ?? ''}, ${place.administrativeArea ?? ''}, ${place.country ?? ''}';
        });
      }
    } catch (e) {
      setState(() {
        addressText = "ไม่สามารถดึงที่อยู่ได้";
      });
    }
  }

  Future<void> _submitToDatabase() async {
    if (!_formKey.currentState!.validate()) return;

    if (addressText == "ยังไม่ได้เลือกตำแหน่ง") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❗ กรุณาเลือกตำแหน่งบนแผนที่")),
      );
      return;
    }

    final url = Uri.parse("http://10.0.2.2:3000/register"); //for emulator
    // final url = Uri.parse(
    //   "http://172.20.10.4:3000/register",
    // ); //check ipconfig for use ipv4 and connect same internet

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "fullname": fullNameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "phone": phoneController.text.trim(),
        "postalCode": zipController.text.trim(),
        "idCard": idCardController.text.trim(),
        "address": addressText.trim(),
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("✅ สมัครสมาชิกสำเร็จ!")));
      _clearForm();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ เกิดข้อผิดพลาด: ${response.body}")),
      );
    }
  }

  void _clearForm() {
    fullNameController.clear();
    phoneController.clear();
    zipController.clear();
    emailController.clear();
    passwordController.clear();
    idCardController.clear();
    setState(() {
      addressText = "ยังไม่ได้เลือกตำแหน่ง";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/back.png',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Image.asset('assets/images/Sign in (1).png', height: 80),
                const SizedBox(height: 20),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            'ชื่อ-นามสกุล',
                            'Fullname',
                            fullNameController,
                          ),
                          _buildTextField(
                            'หมายเลขโทรศัพท์',
                            '0000000000',
                            phoneController,
                          ),
                          _buildTextField(
                            'เลขที่ไปรษณีย์',
                            'xxxxx',
                            zipController,
                          ),
                          _buildTextField(
                            'อีเมล',
                            'example@email.com',
                            emailController,
                          ),
                          _buildTextField(
                            'รหัสผ่าน',
                            '********',
                            passwordController,
                            obscure: true,
                          ),
                          _buildTextField(
                            'เลขบัตรประชาชน',
                            'xxxxxxxxxxxxx',
                            idCardController,
                          ),
                          CheckboxListTile(
                            title: const Text('ที่อยู่ตั้งต้น'),
                            value: isChecked,
                            onChanged:
                                (value) =>
                                    setState(() => isChecked = value ?? true),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black12),
                            ),
                            child: FlutterMap(
                              options: MapOptions(
                                center: selectedLocation,
                                zoom: 15.0,
                                onTap: (tapPos, latlng) {
                                  setState(() {
                                    selectedLocation = latlng;
                                  });
                                  _updateAddressFromLatLng(latlng);
                                },
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  subdomains: ['a', 'b', 'c'],
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: selectedLocation,
                                      width: 40,
                                      height: 40,
                                      builder:
                                          (ctx) => const Icon(
                                            Icons.location_pin,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(addressText, textAlign: TextAlign.center),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _submitToDatabase,
                                  icon: const Icon(Icons.check),
                                  label: const Text('ยืนยัน'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: _clearForm,
                                  child: const Text('ลบ'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    side: const BorderSide(color: Colors.black),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'กรุณากรอก $label';
          }
          if (label == 'อีเมล' &&
              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'อีเมลไม่ถูกต้อง';
          }
          if (label == 'หมายเลขโทรศัพท์' &&
              !RegExp(r'^\d{9,10}$').hasMatch(value)) {
            return 'กรุณากรอกเบอร์โทรให้ถูกต้อง';
          }
          if (label == 'เลขที่ไปรษณีย์' &&
              !RegExp(r'^\d{5}$').hasMatch(value)) {
            return 'รหัสไปรษณีย์ไม่ถูกต้อง';
          }
          if (label == 'รหัสผ่าน' && value.length < 6) {
            return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
          }
          if (label == 'เลขบัตรประชาชน' &&
              !RegExp(r'^\d{13}$').hasMatch(value.replaceAll('-', ''))) {
            return 'กรุณากรอกเลขบัตรประชาชน 13 หลัก';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
