import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            "Settings",
            style: TextStyle(color: Color(0xFF001E2F), fontSize: 24),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 24, 12, 0),
            child: Icon(
              Icons.search,
              size: 24,
              color: Color(0xFF001E2F),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 24, 24, 0),
            child: Icon(
              Icons.more_vert,
              size: 24,
              color: Color(0xFF001E2F),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog();
                    },
                    child: Image.asset(
                      "assets/images/newPic.png",
                      fit: BoxFit.cover,
                      height: 56,
                      width: 56,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 22.0, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daisy",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "+14844578842",
                        style: TextStyle(color: Color(0xFF74777F)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 110, top: 16),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD3E4FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        elevation: 0),
                    child: const Text(
                      "Edit",
                      style: TextStyle(fontSize: 14, color: Color(0xFF1B1C1F)),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "General",
                style: TextStyle(color: Color(0xFF1B72C0), fontSize: 14),
              ),
            ),
            iconsList(
                icon: Icons.notifications_outlined, title: "Notifications"),
            iconsList(icon: Icons.shield_moon_sharp, title: "Appearance"),
            iconsList(icon: Icons.lock_outline, title: "Privacy"),
            iconsList(icon: Icons.cloud_outlined, title: "Storage & Data"),
            iconsList(icon: Icons.question_mark_outlined, title: "About")
          ],
        ),
      ),
    );
  }
}

Widget iconsList({IconData? icon, required String title}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF1B72C0),
          size: 24,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        )
      ],
    ),
  );
}

void showDialog() {
  Get.dialog(AlertDialog(
    content: Image.asset(
      "assets/images/newPic.png",
      fit: BoxFit.fitWidth,
    ),
    title: const Text(
      "Profile",
      style: TextStyle(color: Color(0xFF1B72C0)),
    ),
  ));
}
