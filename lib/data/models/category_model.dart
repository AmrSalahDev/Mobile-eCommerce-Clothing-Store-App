class CategoryModel {
  final String name;

  CategoryModel({required this.name});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(name: "All Items"),
      CategoryModel(name: "Dress"),
      CategoryModel(name: "T - Shirt"),
      CategoryModel(name: "Jeans"),
      CategoryModel(name: "Jumpsuit"),
      CategoryModel(name: "Skirt"),
      CategoryModel(name: "Shorts"),
    ];
  }
}