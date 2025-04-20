import 'package:flutter/material.dart';
import '/components/nav.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';
import '../components/product_card.dart';
import 'product_detail.dart';

class HomeScreen extends StatefulWidget {
  final String fullname;
  const HomeScreen({Key? key, required this.fullname}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> allProducts = [];
  List<Product> displayedProducts = [];
  String selectedType = 'ทั้งหมด';
  TextEditingController searchController = TextEditingController();

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final args = ModalRoute.of(context)?.settings.arguments;
  //   if (args != null && args is Map && args.containsKey('fullname')) {
  //     setState(() {
  //       fullname = args['fullname'] ?? 'Guest'; // fallback กัน null
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    final products = await fetchProducts();
    setState(() {
      allProducts = products;
      displayedProducts = products;
    });
  }

  void filterProducts(String type) {
    setState(() {
      selectedType = type;
      displayedProducts =
          (type == 'ทั้งหมด'
                  ? allProducts
                  : allProducts
                      .where((item) => item.type.trim() == type.trim())
                      .toList())
              .where((item) => _matchesSearch(item))
              .toList();
    });
  }

  void search(String query) {
    setState(() {
      displayedProducts =
          (selectedType == 'ทั้งหมด'
                  ? allProducts
                  : allProducts
                      .where((item) => item.type.trim() == selectedType.trim())
                      .toList())
              .where((item) => _matchesSearch(item, query))
              .toList();
    });
  }

  bool _matchesSearch(Product item, [String? query]) {
    final q = query ?? searchController.text.trim().toLowerCase();
    return item.description.toLowerCase().contains(q) ||
        item.productid.toLowerCase().contains(q);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SECTION 1
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/BG_Home.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/exit.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 40),
                    child: Column(
                      children: [
                        Text(
                          'รักน้ำ ช้อปปิ้ง',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'RAK',
                                style: TextStyle(
                                  fontSize: 64,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'NAM',
                                style: TextStyle(
                                  fontSize: 64,
                                  color: Color(0xFFEEEDE9),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Mall Shop',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEEEDE9),
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFFECE5CE),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.menu, color: Colors.black),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    hintText: 'Hinted search text',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.black87),
                                  ),
                                  style: TextStyle(color: Colors.black),
                                  onChanged: search,
                                ),
                              ),
                              Icon(Icons.search, color: Colors.black),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed:
                              () => Navigator.pushNamed(context, '/contact'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFECE5CE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            'contact',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hello ${widget.fullname}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'ผู้ขาย',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '|',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'ผู้ซื้อ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // SECTION 2
            Container(
              color: Color(0xFFF5F3E4),
              padding: EdgeInsets.only(top: 30, bottom: 50),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        CategoryButton(
                          title: 'ทั้งหมด',
                          onTap: () => filterProducts('ทั้งหมด'),
                        ),
                        CategoryButton(
                          title: 'กระเป๋า',
                          onTap: () => filterProducts('กระเป๋า'),
                        ),
                        CategoryButton(
                          title: 'แหวน',
                          onTap: () => filterProducts('แหวน'),
                        ),
                        CategoryButton(
                          title: 'หมวก',
                          onTap: () => filterProducts('หมวก'),
                        ),
                        CategoryButton(
                          title: 'เข็มกลัด',
                          onTap: () => filterProducts('เข็มกลัด'),
                        ),
                        CategoryButton(
                          title: 'ของใช้',
                          onTap: () => filterProducts('ของใช้'),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: displayedProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final product = displayedProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        ProductDetailPage(product: product),
                              ),
                            );
                          },
                          child: ProductCard(product: product),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CategoryButton({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        splashColor: const Color(0xFFE0C9A6).withOpacity(0.4),
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
