import 'package:flutter/material.dart';
import 'package:money_manager/colors.dart';


// --------------- Button --------------
Widget defaultButton({
  double width = double.infinity,// par detault kayakhdo had 9yam
  Color background = Colors.blue,
  double radius = 6.0,
  required VoidCallback function,
  required String text,
  bool isUpperCAse = true,
}) =>  Container(
  width: width,
  height: 40.0,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCAse ? text.toUpperCase() : text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
);



//------------------TextFormField------------------------------
Widget defaultFormField({
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? onTap,
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix = null,
  bool isPassword = false,
  Function()? suffixPressd,
  bool isClickable = true,
}) =>  TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isClickable,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressd,
      icon: Icon(
        suffix,
      ),
    ) : null,
    border: OutlineInputBorder(),
  ),
);



//------------------ Card ------------------------------
Widget card(
    String name_crd,
    String money,
    ) => Container(
      height: 170.0,
      width: 280.0,
      decoration: BoxDecoration(
        color: MyColors.primaryColor,
        borderRadius: BorderRadius.circular(10.0), // Adjust the radius value as needed
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${name_crd}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/Mastercard.png'),
                    height: 40.0,
                    width: 40.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/card_sim.png'),
                    height: 40.0,
                    width: 40.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    "${money} DH",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      '5234**********987',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/wifi.png'),
                    height: 40.0,
                    width: 40.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

//------------------ Add card-------------------------------------
Widget addCard() => Container(
  height: 170.0,
  width: 280.0,
  decoration: BoxDecoration(
    color: MyColors.primaryColor,
    borderRadius: BorderRadius.circular(10.0), // Adjust the radius value as needed
  ),
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Add new Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            Image(
              image: AssetImage('assets/images/Mastercard.png'),
              height: 40.0,
              width: 40.0,
            ),
          ],
        ),
        SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            onPressed: () {
              // Your code here
            },
            backgroundColor: Color(0xFF4662C5),
            child: const Icon(Icons.add),
          ),
        ),

      ],
    ),
  ),
);


// ------------- list item-----------------
Widget listTransactions() =>  Container(
  padding:const EdgeInsets.all(5.0),
  width: double.infinity,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(children: [
        Container(
          padding:const EdgeInsets.all(10.0),
          child: Text(
              'category'
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'gym'
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                      'Cash'
                  ),
                ],
              ),
              Text('Date + Time'),

            ],
          ),
        ),
        SizedBox(width: 30.0,),
        Text('200 dh'),
        SizedBox(width: 20.0,),
      ],

      )
    ],
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Color.fromRGBO(217, 217, 217, 1),
  ),
);