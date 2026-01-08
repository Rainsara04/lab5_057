import 'package:flutter/material.dart';
import 'package:lab5_057/page/foods.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  String? groupFood;

  List selectedItems = [];
  late List<Foods> foods;

  String? _selectedItem = 'ทานที่ร้าน';
  List<String> dropdownItems = ['ทานที่ร้าน', 'กลับบ้าน', 'จัดส่ง'];

  @override
  void initState() {
    super.initState();
    foods = Foods.getFoodList();
  }

  void handleRadioValueChange(String? value) {
    setState(() {
      groupFood = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Radio & Checkbox Demo")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                RadioListTile(
                  title: const Text("พิซซ่า"),
                  value: 'pizza',
                  groupValue: groupFood,
                  onChanged: handleRadioValueChange,
                ),
                RadioListTile(
                  title: const Text("ชาบู"),
                  value: 'shabu',
                  groupValue: groupFood,
                  onChanged: handleRadioValueChange,
                ),
                RadioListTile(
                  title: const Text("สเต็ก"),
                  value: 'steak',
                  groupValue: groupFood,
                  onChanged: handleRadioValueChange,
                ),
                RadioListTile(
                  title: const Text("สลัด"),
                  value: 'salad',
                  groupValue: groupFood,
                  onChanged: handleRadioValueChange,
                ),
                RadioListTile(
                  title: const Text("แซนวิช"),
                  value: 'sandwich',
                  groupValue: groupFood,
                  onChanged: handleRadioValueChange,
                ),
              ],
            ),

            Text(
              "$groupFood",
              style: const TextStyle(fontSize: 48, color: Colors.red),
            ),

            Column(children: createCheckBox()),

            Text("Selected: $selectedItems"),

            DropdownButton(
              value: _selectedItem,
              items: dropdownItems.map<DropdownMenuItem<String>>((val) {
                return DropdownMenuItem<String>(child: Text(val), value: val);
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createCheckBox() {
    List<Widget> myfoods = [];

    for (Foods food in foods) {
      myfoods.add(
        CheckboxListTile(
          title: Text(food.engName),
          subtitle: Text(food.thaName),
          secondary: Text("ราคา \n${food.price}"),
          value: food.checked,
          onChanged: (bool? value) {
            setState(() {
              food.checked = value ?? false;

              if (food.checked) {
                selectedItems.add(food.thaName);
              } else {
                selectedItems.remove(food.thaName);
              }

              print(selectedItems);
            });
          },
        ),
      );
    }
    return myfoods;
  }
}
