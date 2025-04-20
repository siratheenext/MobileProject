import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Map<String, bool> selectedItems = {}; // productId -> isSelected
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    final cart = Provider.of<CartService>(context, listen: false);
    for (var item in cart.items) {
      selectedItems[item.id] = false;
    }
  }

  void toggleSelectAll(bool? value) {
    final cart = Provider.of<CartService>(context, listen: false);
    setState(() {
      selectAll = value ?? false;
      for (var item in cart.items) {
        selectedItems[item.id] = selectAll;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/back.png', width: 24, height: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('ตะกร้าสินค้า'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/bin.png', // ใส่ path ให้ถูกต้อง
              width: 40,
              height: 40,
            ),
            onPressed: () {
              cart.removeSelectedItems(selectedItems);
              setState(() {
                selectedItems.clear();
                for (var item in cart.items) {
                  selectedItems[item.id] = false;
                }
                selectAll = false;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("ลบสินค้าที่เลือกเรียบร้อยแล้ว")),
              );
            },
          ),
        ],
      ),
      body:
          cart.items.isEmpty
              ? Center(child: Text('ยังไม่มีสินค้าในตะกร้า'))
              : Column(
                children: [
                  CheckboxListTile(
                    title: Text('เลือกทั้งหมด'),
                    value: selectAll,
                    onChanged: toggleSelectAll,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return CheckboxListTile(
                          secondary: Image.asset(item.imageUrl, width: 50),
                          title: Text(item.name),
                          subtitle: Text('฿${item.price} x ${item.quantity}'),
                          value: selectedItems[item.id] ?? false,
                          onChanged: (value) {
                            setState(() {
                              selectedItems[item.id] = value ?? false;
                              selectAll = selectedItems.values.every(
                                (v) => v == true,
                              );
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            final hasSelected = selectedItems.values.any((v) => v == true);
            if (cart.items.isEmpty || !hasSelected) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('ไม่มีสินค้าในตะกร้าที่เลือก')),
              );
              return;
            }

            Navigator.pushNamed(context, '/pay');
          },
          child: Text('ชำระเงินรวม ฿${cart.total.toStringAsFixed(0)}'),
        ),
      ),
    );
  }
}
