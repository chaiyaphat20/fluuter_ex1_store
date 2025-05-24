import 'package:flutter/material.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/themes/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
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
          ],
        ),
      ),
      body: Container(child: const Text("dashboard")),
    );
  }
}
