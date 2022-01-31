class catalogmodel {
  static List<item> items = [];

  // get item by id with this method
  static item getById(int id) =>
      // ignore: null_closures
      items.firstWhere((element) => element.id == id, orElse: null);

  //get by position
  static item getByPos(int pos) => items[pos];
}

class item {
  final num id;
  final String name;
  final num price;
  final String description;
  final String image;
  final String colour;

  item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.colour,
  });

  factory item.fromMap(Map<String, dynamic> map) {
    return item(
      id: map["id"],
      name: map["name"],
      price: map["price"],
      description: map["description"],
      image: map["image"],
      colour: map["color"],
    );
  }

  get title => null;
}
