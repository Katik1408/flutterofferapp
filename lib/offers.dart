import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OffersScreenState();
  }
}

class OffersScreenState extends State<OffersScreen> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: AppBar(
            centerTitle: true,
            leading: GestureDetector(
              onTap: () => {},
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () => {},
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                ),
              )
            ],
            elevation: 0.0,
            flexibleSpace: Container(
              child: Image.asset(
                'images/backg.jpg',
                fit: BoxFit.cover,
              ),
              // DecorationImage(image: BoxDecoration(image: AssetImage(''))),
            ),
          ),
        ),
        body: Text('Inside Offer'),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Offers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Location',
            ),
          ],
          selectedItemColor: Colors.red,
        ),
      ),
    );
  }
}
