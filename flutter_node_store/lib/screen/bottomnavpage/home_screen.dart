import 'package:flutter/material.dart';
import 'package:flutter_node_store/models/api/product/product_response.dart';
import 'package:flutter_node_store/screen/products/components/product_item.dart';
import 'package:flutter_node_store/services/product_api.dart';
import 'package:flutter_node_store/utils/result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Toggle between ListView and GridView
  bool _isGridView = true;

  // สร้างฟังก์ชันสลับระหว่าง ListView และ GridView
  void _toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _toggleView,
          icon: Icon(
            _isGridView
                ? Icons.list_outlined
                : Icons.grid_view,
          ),
        ),
        title: const Text('สินค้า'),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<Result<List<ProductModel>>>(
        future: ProductApi().getAllProduct(),
        builder: (context, snapshot) {
          // กรณีที่ยังโหลดอยู่
          if (snapshot.connectionState !=
              ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // กรณีที่ snapshot มี error (ระดับ Future)
          if (snapshot.hasError) {
            return const Center(
              child: Text('เกิดข้อผิดพลาดบางอย่าง'),
            );
          }

          // กรณี snapshot สำเร็จ
          final result = snapshot.data;

          if (result == null) {
            return const Center(
              child: Text('ไม่สามารถโหลดข้อมูลได้'),
            );
          }

          if (result.isError) {
            return Center(
              child: Text(
                result.errorMessage ?? 'เกิดข้อผิดพลาด',
              ),
            );
          }

          // กรณีโหลดสำเร็จ
          final products = result.data!;
          return _isGridView
              ? _gridView(products)
              : _listView(products);
        },
      ),
    );
  }

  // _gridView Widget -----------------------------------------------------------
  Widget _gridView(List<ProductModel> products) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // จำนวนคอลัมน์
          ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductItem(
            isGrid: true,
            product: products[index],
            onTap: () => {},
          ),
        );
      },
    );
  }
  // ---------------------------------------------------------------------------

  // _listView Widget -----------------------------------------------------------
  Widget _listView(List<ProductModel> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: SizedBox(
            height: 350,
            child: ProductItem(
              product: products[index],
              onTap: () => {},
            ),
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
}
