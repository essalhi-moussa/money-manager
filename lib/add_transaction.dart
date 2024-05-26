import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/compononets.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final List<String> dateOptions = ['Income', 'Expense', 'Transfer'];
  final List<String> list = <String>['Cash', 'Card'];
  final List<String> listCategoryIncome = <String>[
    'Salary',
    'Bonus',
    'Petty cash',
    'Loan'
  ];
  final List<String> listCategoryExpense = <String>[
    'Food',
    'Social Life',
    'Transport',
    'House',
    'Apparel'
  ];
  var amountController = TextEditingController();
  var categoryController = TextEditingController();
  var accountController = TextEditingController();
  var noteController = TextEditingController();
  late int selectedChipIndex = 1;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedDropdownValue;
  String? selectedCategoryValue;
  final List<GlobalKey<FormState>> formKeys = List.generate(3, (index) => GlobalKey<FormState>());

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }
  void _initializeControllers() {
    amountController.clear();
    categoryController.clear();
    accountController.clear();
    noteController.clear();
    selectedCategoryValue = null;
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    selectedDropdownValue = null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: dateOptions.length,
      child: Scaffold(
        appBar: AppBar(
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
              SizedBox(width: 80.0),
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
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/90/a7/f6/90a7f67864acea71fb5ffed6aa6298cb.jpg'),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: dateOptions.map((String option) {
              return Tab(text: option);
            }).toList(),
            onTap: (index) {
              _initializeControllers();
            },
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
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Business'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('School'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: dateOptions.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKeys[index],
                child: ListView(
                  children: [
                    buildDateTimeField(),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      type: TextInputType.number,
                      label: 'Amount',
                      controller: amountController,
                      height: 1.0,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Amount must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    buildDropdownField(
                      label: 'Category',
                      value: selectedCategoryValue,
                      items: option == 'Income'
                          ? listCategoryIncome
                          : listCategoryExpense,
                      onChanged: (String? newValue) {
                        print(newValue);
                        // setState(() {
                        //   selectedCategoryValue = newValue;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    buildDropdownField(
                      label: 'Account',
                      value: selectedDropdownValue,
                      items: list,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDropdownValue = newValue;
                        });
                      }, // Set the desired height here
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      type: TextInputType.text,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Note must not be empty';
                        }
                        return null;
                      },
                      label: 'Note',
                      height: 1.0,
                      controller: noteController,
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    defaultButton(
                      text: 'save',
                      function: () {
                        if (formKeys[index].currentState!.validate()) {
                          print(
                              "++++++++++++++++++++++++++ : ${option} ++++++++++++++++++++++++++ : ");
                          print("selectedDate : ${selectedDate}");
                          print("selectedTime : ${selectedTime}");
                          print("amountController : ${amountController.text}");
                          print(
                              "selectedCategoryValue : ${selectedCategoryValue}");
                          print(
                              "selectedDropdownValue : ${selectedDropdownValue}");
                          print("noteController : ${noteController.text}");
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildDateTimeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  selectedDate != null
                      ? DateFormat.yMd().format(selectedDate!)
                      : 'Select Date',
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: InkWell(
              onTap: () async {
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: selectedTime ?? TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    selectedTime = picked;
                  });
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Time',
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  selectedTime != null
                      ? selectedTime!.format(context)
                      : 'Select Time',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
