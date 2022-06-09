final String tableCar = 'cars';

class CarFields{
  static final List<String> values = [
    /// Add all fields
    id, name, price
  ];
  static final String id = '_id';
  static final String name = "name";
  static final String price = "price";
}

class Car{
  final int? id;
  final String name;
  final String price;

  const Car({
    this.id,
    required this.name,
    required this.price
  });

  Car copy({
    int? id,
    String? name,
    String? price
  }) => Car(
      id:  id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price
  );

  static Car fromJson(Map<String, Object?> json) => Car(
    id: json[CarFields.id] as int?,
    name: json[CarFields.name] as String,
    price: json[CarFields.price] as String,
  );

  Map<String, Object?> toJson() =>{
    CarFields.id: id,
    CarFields.name: name,
    CarFields.price: price
  };
}