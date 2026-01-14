import 'package:flutter/material.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final String image;
  final String category;
  final double rating;
  final bool isFavorite;
  final List<Color> colors;
  final List<String> sizes;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
    required this.isFavorite,
    required this.colors,
    required this.sizes,
  });

  static final List<ProductModel> products = [
    ProductModel(
      id: 1,
      title: "Modern Light T-shirt",
      description:
          "A modern light t-shirt designed with premium quality cotton fabric. Perfect for casual wear and comfortable all day long. Features a classic crew neck design with a contemporary fit. Great for layering or wearing standalone.",
      price: 212,
      category: "T-Shirt",
      rating: 4.5,
      isFavorite: true,
      image:
          "https://images.unsplash.com/photo-1622925930212-b5b1606f0aab?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      colors: [Colors.red, Colors.blue, Colors.green],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    ProductModel(
      id: 2,
      title: "Red Dress Bless",
      description:
          "A light modern dress that combines style and comfort in perfect harmony. Made from breathable fabric that's ideal for warm weather. Features an elegant silhouette with flattering cuts. Perfect for casual outings or special occasions.",
      price: 162,
      category: "Dress modern",
      rating: 4.0,
      isFavorite: false,
      image:
          "https://images.unsplash.com/photo-1595777457583-95e059d581b8?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      colors: [Colors.pink, Colors.yellow, Colors.white],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    ProductModel(
      id: 3,
      title: "Black Crew Neck T-shirt",
      description:
          "A black crew neck t-shirt made with high-quality cotton blend material. Timeless design that works with any wardrobe. Features reinforced stitching and superior durability. Perfect for both everyday wear and layering.",
      category: "T-Shirt",
      price: 212,
      isFavorite: false,
      rating: 4.8,
      image:
          "https://images.unsplash.com/photo-1622519407650-3df9883f76a5?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      colors: [Colors.black, Colors.grey, Colors.white],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    ProductModel(
      id: 4,
      title: "Red Jumpsuit",
      description:
          "A stylish red jumpsuit that makes a bold fashion statement. Crafted with premium fabric for a comfortable and flattering fit. Features functional pockets and an elegant tapered leg design. Perfect for parties, events, or fashionable everyday wear.",
      price: 162,
      category: "Jumpsuit",
      isFavorite: true,
      rating: 4.3,
      image:
          "https://plus.unsplash.com/premium_photo-1673758905770-a62f4309c43c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      colors: [Colors.red, Colors.orange, Colors.purple],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    ProductModel(
      id: 5,
      title: "Yellow Tracksuit",
      description:
          "A vibrant yellow tracksuit that combines style with athletic performance. Made from breathable, moisture-wicking fabric for maximum comfort. Features a modern design with coordinating jacket and pants. Ideal for workouts, running errands, or casual street style.",
      price: 89,
      category: "Tracksuit",
      rating: 4.6,
      isFavorite: false,
      image:
          "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bW9kZWx8ZW58MHx8MHx8fDA%3D",
      colors: [Colors.yellow, Colors.blueGrey, Colors.brown],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    ProductModel(
      id: 6,
      title: "Colorful Jacket",
      description:
          "A colorful jacket featuring vibrant hues and contemporary design elements. Made with lightweight material perfect for layering. Offers excellent versatility for different weather conditions and occasions. Features practical pockets and a comfortable fit for all-day wear.",
      category: "Jacket",
      rating: 4.9,
      isFavorite: true,
      price: 49,
      image:
          "https://plus.unsplash.com/premium_photo-1673757121382-3819b3274335?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      colors: [Colors.cyan, Colors.lime, Colors.indigo],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    ProductModel(
      id: 7,
      title: "Black Sweater",
      description:
          "A classic black sweater that never goes out of style. Made from premium knit fabric with a soft, luxurious feel. Features a sophisticated design perfect for both casual and professional settings. Ideal for layering or wearing as a standalone piece.",
      category: "Sweater",
      rating: 4.4,
      price: 49,
      isFavorite: false,
      image:
          "https://images.unsplash.com/photo-1702440984605-3eded8e03c1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      colors: [Colors.black, Colors.white70, Colors.grey],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
  ];
}
