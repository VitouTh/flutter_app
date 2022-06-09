
class Tourist {
  final int id;
  final String name;
  final String description;
  final String link;
  final String number;
  final String img;
  final String place;

  Tourist({this.id = 0, this.name = '', this.description = '', this.link = '', this.number = '', this.place = '',this.img = ''});

  factory Tourist.fromJson(Map<String, dynamic> json) {
    return Tourist(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      link: json['link'],
      number: json['number'],
      place: json['place'],
      img: json['image']
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'link': link,
    'number': number,
    'place': place,
    'image': img
  };
}
