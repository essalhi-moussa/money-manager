import 'package:flutter/material.dart';
import 'package:money_manager/components/compononets.dart';

import 'colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(width: 80.0,),
            Expanded(
              child: Text(
                'Wallet',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://i.pinimg.com/originals/90/a7/f6/90a7f67864acea71fb5ffed6aa6298cb.jpg'),
            ),
          ],
        ),


      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              // selected: selectedDrawerIndex == 0, // Set to true if the item is selected
              onTap: () {
                // Update the state of the app
                // setState(() {
                //   selectedDrawerIndex = 0; // Update the selectedDrawerIndex
                // });
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              // selected: selectedDrawerIndex == 1, // Set to true if the item is selected
              onTap: () {
                // Update the state of the app
                // setState(() {
                //   selectedDrawerIndex = 1; // Update the selectedDrawerIndex
                // });
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              // selected: selectedDrawerIndex == 2, // Set to true if the item is selected
              onTap: () {
                // Update the state of the app
                // setState(() {
                //   selectedDrawerIndex = 2; // Update the selectedDrawerIndex
                // });
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    card('Cash', '250'),
                    SizedBox(width: 20.0,),
                    addCard(),
                  ],
                ),
              ),
              SizedBox(height: 25.0,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Rest',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:MyColors.primaryColor ,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '300 DH',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black ,
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      padding:const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Expenses',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:MyColors.primaryColor ,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '945 DH',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black ,
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'All transactions',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 10.0,),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => listTransactions(),
                itemCount: 10,
              )
            ],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
          backgroundColor: MyColors.primaryColor,
          foregroundColor: Colors.white,
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: MyColors.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.timeline,
                  color: Colors.blue,
                ),
                Text(
                  "Trans",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 70.0, top: 3.0,),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.bar_chart,
                    color: Colors.white,
                  ),
                  Text(
                    "Report",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 10.0, top: 0.0, ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.pie_chart,
                    color: Colors.white,
                  ),
                  Text(
                    "planning",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                Text(
                  "Setting",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}
