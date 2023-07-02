import 'package:bank_app/pages/home_pages/home.dart';
import 'package:bank_app/pages/settings_pages/profile.dart';
import 'package:flutter/material.dart';
import 'pages/bills_pages/bills_manage_page.dart';
import 'pages/funds_pages/funds_transfer_page.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Funds(),
    Bills(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xffff735c),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance), label: 'Accounts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money), label: 'Fund Transfer'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), label: 'Bills'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          )),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Really? '),
            content: Text('Do you want to close the app??'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    'Yes 🥲',
                    style: TextStyle(color: Color(0xffff735c)),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    'No 😄',
                    style: TextStyle(color: Color(0xffff735c)),
                  ))
            ],
          );
        });
    return exitApp ?? false;
  }
}
