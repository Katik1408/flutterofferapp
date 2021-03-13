import 'package:flutter/material.dart';

import 'main.dart';
import 'offers.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuScreenState();
  }
}

class MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (_currentIndex) {
        case 0:
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
          break;
        case 1:
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OffersScreen()),
          );
          break;
      }
    });
  }

  List<MenuItem> _data = generateItems(1);

  Widget _buildListPane() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>(
        (MenuItem menuItem) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(menuItem.headerValue),
              );
            },
            body: ListTile(
              title: Text(menuItem.expandedValue),
              subtitle: Text('This is Menu Item 1'),
            ),
            isExpanded: menuItem.isExpanded,
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            leading: GestureDetector(
              onTap: () => {},
              child: InkWell(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
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
            // flexibleSpace: Container(
            //   child: Image.asset(
            //     'images/backg.jpg',
            //     fit: BoxFit.cover,
            //   ),
            //   // DecorationImage(image: BoxDecoration(image: AssetImage(''))),
            // ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: _buildListPane(),
            ),
          ),
        ),
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
          selectedItemColor: Colors.green[200],
        ),
      ),
    );
  }
}

class MenuItem {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  MenuItem({this.expandedValue, this.headerValue, this.isExpanded});
}

List<MenuItem> generateItems(int numberOfMenuItems) {
  return List.generate(numberOfMenuItems, (index) {
    return MenuItem(
      headerValue: 'Panel $index',
      expandedValue: 'This is item Number $index',
    );
  });
}
