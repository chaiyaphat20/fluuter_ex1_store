import 'package:flutter/material.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/screen/bottomnavpage/home_screen.dart';
import 'package:flutter_node_store/screen/bottomnavpage/notification_screen.dart';
import 'package:flutter_node_store/screen/bottomnavpage/profile_screen.dart';
import 'package:flutter_node_store/screen/bottomnavpage/report_screen.dart';
import 'package:flutter_node_store/screen/bottomnavpage/setting_screen.dart';
import 'package:flutter_node_store/themes/colors.dart';
import 'package:flutter_node_store/utils/utility.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // ส่วนของการสร้าง Bottom Navigation Bar ---------------------------------
  // สร้างตัวแปรเก็บ title ของแต่ละหน้า
  String _title = 'Flutter Store';

  // สร้างตัวแปรเก็บ index ของแต่ละหน้า
  int _currentIndex = 2;

  // สร้าง List ของแต่ละหน้า
  final List<Widget> _children = [
    const HomeScreen(),
    const ReportScreen(),
    const NotificationScreen(),
    const SettingScreen(),
    const ProfileScreen(),
  ];

  // ฟังก์ขันในการเปลี่ยนหน้า โดยรับค่า index จากการกดที่ bottomNavigationBar
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'Home';
          break;
        case 1:
          _title = 'Report';
          break;
        case 2:
          _title = 'Notification';
          break;
        case 3:
          _title = 'Setting';
          break;
        case 4:
          _title = 'Profile';
          break;
        default:
          _title = 'Flutter Store';
      }
    });
  }
  // ---------------------------------------------------------------------------

  // Logout function -----------------------------------------------------------
  void _logout() {
    //Remove token,loginStatus sharedPref
    Utility.removeSharedPreference("token");
    Utility.removeSharedPreference("loginStatus");

    //clear all route and push to login screen
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRouter.login,
      (route) => false,
    );
  }

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text("chaiyaphat supharak"),
                  accountEmail: Text(
                    "chaiyaphat@gmail.com",
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/noavartar.png",
                    ),
                  ),
                  otherAccountsPictures: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/noavartar.png",
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text("Info"),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.info,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person_2_outlined,
                  ),
                  title: const Text("About"),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.about,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text("Contact"),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.contact,
                    );
                  },
                ),
              ],
            ),
            Expanded(
              //จะเอาพื้นที่ที่เหลือ
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  0,
                  0,
                  20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.exit_to_app_outlined,
                      ),
                      title: const Text("Logout"),
                      onTap: _logout,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryDark,
        unselectedItemColor: secondaryText,
        onTap: (index) {
          onTabTapped(index);
        },
      ),
    );
  }
}
