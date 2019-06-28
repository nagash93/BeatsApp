import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String nombre;
  String url;
  double precio;
  bool favorito;
  String titulo;
  String subtitulo;
  int bateria;
  int color;

  Product({
    this.nombre,
    this.url,
    this.precio,
    this.favorito,
    this.titulo,
    this.subtitulo,
    this.bateria,
    this.color,
  });

  factory Product.fromJson(Map<String, dynamic> json) => new Product(
        nombre: json["nombre"],
        url: json["url"],
        precio: json["precio"],
        favorito: json["favorito"],
        titulo: json["titulo"],
        subtitulo: json["subtitulo"],
        bateria: json["bateria"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "url": url,
        "precio": precio,
        "favorito": favorito,
        "titulo": titulo,
        "subtitulo": subtitulo,
        "bateria": bateria,
        "color": color,
      };
}
