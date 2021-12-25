enum Screen {
  explore,
  settings,
  prodcts,
}

enum Order {
  price,
  expireDate,
  views,
  quantity,
  discount,
  likes,
}

enum Category {
  cannedFood,
  vegetable,
  beverages,
}

extension GetCategory on Category {
  String getString() => toString().split('.').last;
}

extension GetScreen on Screen {
  String getString() => toString().split('.').last;
}
