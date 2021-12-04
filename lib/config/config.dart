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

extension Get on Category {
  String getString() => toString().split('.').last;
}
