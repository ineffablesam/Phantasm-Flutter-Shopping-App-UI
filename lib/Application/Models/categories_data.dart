class Categories {
  final String image, title;
  Categories({
    required this.image,
    required this.title,
  });
}

final List<Categories> categoriesData = [
  Categories(
    title: 'Salt NIC',
    image: 'assets/icons/catg_1.png',
  ),
  Categories(
    title: 'Disposables',
    image: 'assets/icons/catg_2.png',
  ),
  Categories(
    title: 'Smoke Shop',
    image: 'assets/icons/catg_3.png',
  ),
  Categories(
    title: 'Glasses',
    image: 'assets/icons/catg_4.png',
  ),
];
