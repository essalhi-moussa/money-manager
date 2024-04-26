import 'package:flutter/material.dart';
import 'package:money_manager/components/compononets.dart';

import 'colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(
                  children: [
                    card('Cash', '250'),
                    SizedBox(width: 20.0,),
                    addCard(),
                  ],
                )
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Rest',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color:MyColors.primaryColor ,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          '300 DH',
                          style: TextStyle(
                            fontSize: 26.0,
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
                    padding:const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Expenses',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color:MyColors.primaryColor ,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          '945 DH',
                          style: TextStyle(
                            fontSize: 26.0,
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
              height: 50.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'All transactions',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10.0,),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => listTransactions(),
                itemCount: 10,
              
              ),
            )



          ],

        ),
        //
        //
      ),

    );
  }
}
