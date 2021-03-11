import 'package:flutter/material.dart';
import 'offers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _listItem = [
    'images/feedback.png',
    'images/location.png',
    'images/insta.png',
    'images/face.png',
  ];

  int _currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: AppBar(
            centerTitle: true,
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
                            splashColor: Colors.green,
                            onTap: () => {},
                            child: GestureDetector(
                              onTap: () => {print('Item is ' + item)},
                              child: Container(
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
          selectedItemColor: Colors.red,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 1:
          Navigator.of(context).push(
            (MaterialPageRoute(builder: (context) => OffersScreen())),
          );
      }
    });
  }
}
