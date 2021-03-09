// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

class Character {
  Character({
    this.id,
    this.name,
    this.image,
  });

  String id;
  String name;
  String image;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
