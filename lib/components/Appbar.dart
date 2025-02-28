import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Online Labs',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1, // Subtle shadow for depth
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onSelected: (String value) {
            // Handle menu item selection
            switch (value) {
              case 'Home':
                // Navigate to home
                break;
              case 'About us':
                // Navigate to about
                break;
              case 'Statistics':
                // Navigate to statistics
                break;
              case 'Rate us':
                // Navigate to rate us
                break;
              case 'Credits':
                // Navigate to credits
                break;
              case 'Share':
                // Handle share
                break;
              case 'Logout':
                // Handle logout
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Home',
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.black87),
                title: Text('Home', style: TextStyle(color: Colors.black87)),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'About us',
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.black87),
                title:
                    Text('About us', style: TextStyle(color: Colors.black87)),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'Statistics',
              child: ListTile(
                leading: Icon(Icons.bar_chart, color: Colors.black87),
                title:
                    Text('Statistics', style: TextStyle(color: Colors.black87)),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'Rate us',
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.black87),
                title: Text('Rate us', style: TextStyle(color: Colors.black87)),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'Credits',
              child: ListTile(
                leading: Icon(Icons.people, color: Colors.black87),
                title: Text('Credits', style: TextStyle(color: Colors.black87)),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'Share',
              child: ListTile(
                leading: Icon(Icons.share, color: Colors.black87),
                title: Text('Share', style: TextStyle(color: Colors.black87)),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'Logout',
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.black87),
                title: Text('Logout', style: TextStyle(color: Colors.black87)),
              ),
            ),
          ],
          color: Colors.white, // White background for the popup menu
          elevation: 2, // Subtle elevation for the popup
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
