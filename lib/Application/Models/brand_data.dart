class Brand {
  final String image, title;
  Brand({
    required this.image,
    required this.title,
  });
}

final List<Brand> brandData = [
  Brand(
    title: 'Amazon',
    image: 'assets/icons/brand_1.png',
  ),
  Brand(
    title: 'Lacoste',
    image: 'assets/icons/brand_2.png',
  ),
  Brand(
    title: 'Lego',
    image: 'assets/icons/brand_3.png',
  ),
  Brand(
    title: 'Nutella',
    image: 'assets/icons/brand_4.png',
  ),
];
