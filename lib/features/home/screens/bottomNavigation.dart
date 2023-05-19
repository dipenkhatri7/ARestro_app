import 'package:arestro_app/features/cart/screens/cart.dart';
import 'package:arestro_app/features/home/screens/dashboard.dart';
import 'package:arestro_app/features/home/widgets/profileImage.dart';
import 'package:arestro_app/features/notifications/screens/notifications.dart';
import 'package:arestro_app/features/search/screens/search.dart';
import 'package:arestro_app/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  static const String routeName = '/BottomNavigation';
  BottomNavigation({Key? key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          'assets/images/Appbar.png',
          height: 38.45,
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.notifications_outlined),
                tooltip: 'Notifications',
                onPressed: () {
                  Navigator.pushNamed(context, '/Notifications');
                },
              ),
              // ProfileImage(
              //   ispressed: true,
              //   radius: 18,
              //   images: "assets/images/me2.png",
              // ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.65,
        child: ListView(
          children: [
            _createHeader(context),
            const SizedBox(
              height: 5,
            ),
            _createDrawerItem(
              icon: Icons.home_outlined,
              text: 'Home',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            _createDrawerItem(
              icon: Icons.restaurant_outlined,
              text: 'Restaurants',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            _createDrawerItem(
              icon: Icons.food_bank_outlined,
              text: 'Food',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            _createDrawerItem(
              icon: Icons.dashboard_outlined,
              text: 'Dashboard',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            _createDrawerItem(
              icon: Icons.history_outlined,
              text: 'History',
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Divider(),
            // put space

            _createDrawerItem(
              icon: Icons.notifications,
              text: 'Notifications',
              onTap: () {
                Navigator.pushNamed(context, Notifications.routeName);
              },
            ),
            _createDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                Navigator.pushNamed(context, Settings.routeName);
              },
            ),
            const Divider(),
            _createDrawerItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/signIn', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _buildPage(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Dashboard();
      case 1:
        return Search();
      case 2:
        return Cart();
      case 3:
        return Center(child: Settings());
      default:
        return Center(
          child: Text('Invalid Page'),
        );
    }
  }

  Widget _createHeader(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: DrawerHeader(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/images/Appbar.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 14.45,
      ),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Color(0xff5E5E5E),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                text,
                style: const TextStyle(
                    color: Color(0xff5E5E5E),
                    fontSize: 17.45,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.45),
              ),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
