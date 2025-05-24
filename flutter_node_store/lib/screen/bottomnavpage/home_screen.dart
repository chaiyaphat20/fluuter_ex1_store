import 'package:flutter/material.dart';

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
      body: _isGridView ? _gridView() : _listView(),
    );
  }

  // _gridView Widget -----------------------------------------------------------
  Widget _gridView() {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // จำนวนคอลัมน์
          ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  // ---------------------------------------------------------------------------

  // _listView Widget -----------------------------------------------------------
  Widget _listView() {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: SizedBox(
            height: 350,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
}
