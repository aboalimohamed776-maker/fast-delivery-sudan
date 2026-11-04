class Restaurant {
  const Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.deliveryTime,
    required this.isOpen,
  });

  final String id;
  final String name;
  final String image;
  final double rating;
  final String deliveryTime;
  final bool isOpen;

  factory Restaurant.fromFirestore(String id, Map<String, dynamic> data) {
    final rawRating = data['rating'];
    return Restaurant(
      id: id,
      name: data['name'] as String? ?? '',
      image: data['image'] as String? ?? '',
      rating: rawRating is num ? rawRating.toDouble() : 0,
      deliveryTime: data['deliveryTime'] as String? ?? data['delivery_time'] as String? ?? '',
      isOpen: data['isOpen'] as bool? ?? data['is_open'] as bool? ?? false,
    );
  }

  Map<String, Object?> toMap() => {
        'name': name,
        'image': image,
        'rating': rating,
        'deliveryTime': deliveryTime,
        'isOpen': isOpen,
      };
}
