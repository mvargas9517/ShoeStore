class Shoe {
  final String imageUrl;
  final String name;
  final int price;
  final String brand;
  final String description;

Shoe({this.imageUrl, this.name, this.price, this.brand, this.description});

}

final List<Shoe> shoes = [
    Shoe(
    imageUrl: 'assets/images/shoe0.png',
    name: ' Yeezy Boost 350',
    price: 700,
    brand: 'Adidas:',
    description: 'Kanye West marked 2016 with the release of the eagerly awaited Yeezy Season 3. Teaming with Adaidas once again, West delivers a fresh edition of the reworked icon that is the Yeezy 350 Boost.',
    ),
    Shoe(
    imageUrl: 'assets/images/shoe1.png',
    name: '  Jordan Retro 2' ,
    price: 200,
    brand: 'Air Jordan:',
    description: 'Kanye West marked 2016 with the release of the eagerly awaited Yeezy Season 3. Teaming with Adaidas once again, West delivers a fresh edition of the reworked icon that is the Yeezy 350 Boost.',
    ),
    Shoe(
    imageUrl: 'assets/images/shoe2.png',
    name: '  Nike Free Runs' ,
    price: 85,
    brand: 'Nike:',
    description: 'Kanye West marked 2016 with the release of the eagerly awaited Yeezy Season 3. Teaming with Adaidas once again, West delivers a fresh edition of the reworked icon that is the Yeezy 350 Boost.',
    ),
    Shoe(
    imageUrl: 'assets/images/shoe3.png',
    name: '  Adidas Boosts' ,
    price: 150,
    brand: 'Adidas:',
    description: 'Kanye West marked 2016 with the release of the eagerly awaited Yeezy Season 3. Teaming with Adaidas once again, West delivers a fresh edition of the reworked icon that is the Yeezy 350 Boost.',
    ),
];