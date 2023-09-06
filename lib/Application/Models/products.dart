class Products {
  final String image, title, category, rating, price, description, id;
  Products(
    this.category,
    this.rating,
    this.price,
    this.description,
    this.id, {
    required this.image,
    required this.title,
  });
}

final List<Products> productsData = [
  Products(
    'Salt NIC',
    '4.9',
    '20',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget augue eget augue sodales fermentum. ',
    '1',
    title: 'POSH Max',
    image: 'assets/images/product_1.png',
  ),
  Products(
    'Salt NIC',
    '4.9',
    '20',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget augue eget augue sodales fermentum. ',
    '2',
    title: 'Funky Rep',
    image: 'assets/images/product_2.png',
  ),
  Products(
    'Salt NIC',
    '4.9',
    '20',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget augue eget augue sodales fermentum. ',
    '3',
    title: 'Esco Bar',
    image: 'assets/images/product_3.png',
  ),
  Products(
    'Salt NIC',
    '4.9',
    '20',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget augue eget augue sodales fermentum. ',
    '4',
    title: 'Lost Mary',
    image: 'assets/images/product_4.png',
  ),
  Products(
    'Salt NIC',
    '4.9',
    '20',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget augue eget augue sodales fermentum. ',
    '1',
    title: 'POSH Max',
    image: 'assets/images/product_1.png',
  ),
  Products(
    'Salt NIC',
    '4.9',
    '20',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget augue eget augue sodales fermentum. ',
    '2',
    title: 'Funky Rep',
    image: 'assets/images/product_2.png',
  ),
  Products(
    'Salt NIC',
    '4.9',
    '20',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget augue eget augue sodales fermentum. ',
    '3',
    title: 'Esco Bar',
    image: 'assets/images/product_3.png',
  ),
  Products(
    'Salt NIC',
    '4.9',
    '20',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget augue eget augue sodales fermentum. ',
    '4',
    title: 'Lost Mary',
    image: 'assets/images/product_4.png',
  ),
];
