class catalogmodel {
  static List<item> items = [
  ];
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
