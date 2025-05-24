import 'package:flutter/material.dart';

class Ex1 extends StatelessWidget {
  const Ex1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: Container(
        color: Colors.pink,
        child: Center(
          child: Container(
            color: Colors.red,
            child: const Column(
              children: [
                Text("AAA"),
                Text("BBBBBBB"),
                Text("DDDDDDDDD"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 1.column
// android:orientation="vertical"
// height: match_parent
// width: wrap_content
// <LinearLayout
//     android:orientation="vertical"
//     android:layout_width="wrap_content"
//     android:layout_height="match_parent">

//     <TextView
//         android:layout_width="wrap_content"
//         android:layout_height="wrap_content"
//         android:text="Item 1" />

//     <TextView
//         android:layout_width="wrap_content"
//         android:layout_height="wrap_content"
//         android:text="Item 2" />
// </LinearLayout>

// 2.row
// android:orientation="horizontal"
// height: wrap_content
// width: match_parent
// <LinearLayout
//     android:orientation="horizontal"
//     android:layout_width="match_parent"
//     android:layout_height="wrap_content">

//     <TextView
//         android:layout_width="wrap_content"
//         android:layout_height="wrap_content"
//         android:text="Item 1" />

//     <TextView
//         android:layout_width="wrap_content"
//         android:layout_height="wrap_content"
//         android:text="Item 2" />

// </LinearLayout>

// 3.center
// height: match_parent
// width: match_parent
// ถ้ามี child จะให้ child อยู่ตรงกลาง
// <FrameLayout
//     android:layout_width="match_parent"
//     android:layout_height="match_parent"
//     android:gravity="center">

//     <TextView
//         android:layout_width="wrap_content"
//         android:layout_height="wrap_content"
//         android:text="Hello" />
// </FrameLayout>
