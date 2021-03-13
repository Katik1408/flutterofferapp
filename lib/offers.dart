import 'package:flutter/material.dart';
import 'package:offerapp/main.dart';

class OffersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OffersScreenState();
  }
}

class OffersScreenState extends State<OffersScreen> {
  int _currentIndex = 0;
  final List<String> _listItem = [
    'images/feedback.png',
    'images/location.png',
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (_currentIndex) {
        case 0:
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
          break;
      }
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
          child: Container(
            child: Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(30),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _listItem
                    .map(
                      (item) => Card(
                        child: Center(
                          child: InkWell(
                            onTap: () => {print('Item is ' + item)},
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(item),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
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
