class Restaurant {
  const Restaurant({required this.name, required this.image, required this.state, required this.deliveryFee});
  final String name;
  final String image;
  final String state;
  final double deliveryFee;

  Map<String, Object?> toMap() => {
        'name': name,
        'image': image,
        'state': state,
        'delivery_fee': deliveryFee,
      };
}
