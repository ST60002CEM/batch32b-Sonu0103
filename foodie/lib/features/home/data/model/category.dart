class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(
    title: "All",
    image: "assets/images/food_3.png",
  ),
  Category(
    title: "Salad",
    image: "assets/images/menu_1.png",
  ),
  Category(
    title: "Rolls",
    image: "assets/images/menu_2.png",
  ),
  Category(
    title: "Dessert",
    image: "assets/images/menu_3.png",
  ),
  Category(
    title: "Sandwiches",
    image: "assets/images/menu_4.png",
  ),
  Category(
    title: "Dessert",
    image: "assets/images/menu_5.png",
  ),
];