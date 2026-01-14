class ProductModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final String image;
  final String category;
  final double rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
  });

  static final List<ProductModel> products = [
    ProductModel(
      id: 1,
      title: "Modern Light T-shirt",
      description: "A modern light t-shirt",
      price: 212,
      category: "T-Shirt",
      rating: 4.5,
      image:
          "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    ),
    ProductModel(
      id: 2,
      title: "Light Dress Bless",
      description: "A light modern dress",
      price: 162,
      category: "Dress modern",
      rating: 4.0,
      image:
          "https://images.unsplash.com/photo-1595777457583-95e059d581b8?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    ),
    ProductModel(
      id: 3,
      title: "Black Crew Neck T-shirt",
      description: "A black crew neck t-shirt",
      category: "T-Shirt",
      price: 212,
      rating: 4.8,
      image:
          "https://images.unsplash.com/photo-1622519407650-3df9883f76a5?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    ProductModel(
      id: 4,
      title: "Red Jumpsuit",
      description: "A stylish red jumpsuit",
      price: 162,
      category: "Jumpsuit",
      rating: 4.3,
      image:
          "https://plus.unsplash.com/premium_photo-1673758905770-a62f4309c43c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    ProductModel(
      id: 5,
      title: "Yellow Tracksuit",
      description: "A vibrant yellow tracksuit",
      price: 89,
      category: "Tracksuit",
      rating: 4.6,
      image:
          "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bW9kZWx8ZW58MHx8MHx8fDA%3D",
    ),
    ProductModel(
      id: 6,
      title: "Colorful Jacket",
      description: "A colorful jacket",
      category: "Jacket",
      rating: 4.9,
      price: 49,
      image:
          "https://plus.unsplash.com/premium_photo-1673757121382-3819b3274335?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    ProductModel(
      id: 7,
      title: "Black Sweater",
      description: "A classic black sweater",
      category: "Sweater",
      rating: 4.4,
      price: 49,
      image:
          "https://images.unsplash.com/photo-1702440984605-3eded8e03c1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
  ];
}
