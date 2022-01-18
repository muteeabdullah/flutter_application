class catalogmodel {
static final items = [
 item(
  1, 
 "iphone 12", 
 999, 
 "iphone 12 red colour 128 GB",
  "https://3g.co.uk/userfiles/products/n_1433-1.jpg",
  "OxFFD32F2F")
];
}
class item {
  final num id;
  final String name;
  final num price;
  final String description;
  final String image;
  final String colour;

  item(this.id, this.name, this.price, this.description, this.image, this.colour);
}
