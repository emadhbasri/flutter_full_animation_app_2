class Category {
  final String name;
  final String image;
  Category(this.name, this.image);
}

class FoodCount {
  int count;
  Food food;
  FoodCount(this.count, this.food);
}

class Food {
  final int id;
  final String image;
  final String name;
  final String desc;
  final String desc1;
  final String resepi;
  final double price;
  final String category;
  final String weight;
  final String calories;
  bool like = false;
  final int peope;
  Food({
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.desc,
    required this.price,
    required this.desc1,
    required this.resepi,
    required this.weight,
    required this.calories,
    required this.peope,
  });
}

class Shop {
  int id;
  String image;
  String name;
  CategoryType category;
  String type;
  String time;
  String meter;
  List<String> categorysName = [
    'Most popular',
    'Donuts',
    'Ice Creams',
    'Cakes',
    'Drinks',
  ];
  bool like;
  double star;
  Shop(
    this.id,
    this.image,
    this.name,
    this.category,
    this.type,
    this.time,
    this.meter,
    this.like,
    this.star,
  );
}

enum CategoryType { all, burgers, pizza, desert }

enum Tabs { home, search, cart, profile }

enum PageName { shops, shop, food, cart, delivery }
