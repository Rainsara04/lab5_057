class Foods {
  String engName;
  String thaName;
  bool checked;
  double price;

  Foods({
    required this.engName,
    required this.thaName,
    required this.checked,
    required this.price,
  });
  static List<Foods> getFoodList() {
    return [
      Foods(engName: 'pizza', thaName: 'พิซซ่า', checked: false, price: 199.0),
      Foods(engName: 'chabu', thaName: 'ชาบู', checked: false, price: 299.0),
      Foods(engName: 'steak', thaName: 'สเต็ก', checked: false, price: 149.0),
      Foods(engName: 'salad', thaName: 'สลัด', checked: false, price: 39.0),
      Foods(engName: 'somtam', thaName: 'ส้มตำ', checked: false, price: 25.0),
    ];
  }
}
