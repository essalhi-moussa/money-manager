import 'package:flutter/material.dart';
import 'package:money_manager/colors.dart';

import 'components/compononets.dart';

class AllTransactionScreen extends StatefulWidget {
  const AllTransactionScreen({Key? key}) : super(key: key);

  @override
  _AllTransactionScreenState createState() => _AllTransactionScreenState();
}

class _AllTransactionScreenState extends State<AllTransactionScreen> {
  late DateTime selectedDate = DateTime.now();
  late int selectedChipIndex = 0;
  final List<String> dateOptions = ['day', 'last week', 'last month', 'note'];

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
                'All Transaction',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 8.0,
                  children: List<Widget>.generate(dateOptions.length, (int index) {
                    return FilterChip(
                      label: Text(dateOptions[index]),
                      selected: selectedChipIndex == index,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedChipIndex = selected ? index : selectedChipIndex;
                        });

                        // Handle action based on selected chip
                        if ( dateOptions[index] == 'day') {
                          _showDatePicker(context);
                        }
                      },
                      selectedColor: MyColors.primaryColor,
                      labelStyle: TextStyle(
                        color: selectedChipIndex == index ? Colors.white : MyColors.primaryColor,
                      ),
                      backgroundColor: Colors.white,
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: MyColors.primaryColor,
                          width: 1.0,
                        ),
                      ),
                      showCheckmark: false,
                    );
                  }),
                ),
              ),
              SizedBox(height: 20.0,),
              ListView.separated(
                // physics: NeverScrollableScrollPhysics(),
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
    );
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
