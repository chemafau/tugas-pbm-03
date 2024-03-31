import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Vivienne Westwood';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            'images/logo.png', // Ganti dengan path/logo gambar yang sesuai
            width: 125,
            height: 85,
          ),
          title: Text(
            appTitle,
            style: TextStyle(
              fontFamily: 'Raphael',
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(
                image: 'images/bag.jpg',
              ),
              TitleSection(
                  name: 'Britney Small Handbag',
                  price: '€1,330',
                  warna: 'Color: BLACK',
                  size: 'Size: ONE SIZE'),
              CartSection(),
              TextSection(
                description:
                'The Britney Small handbag has been refreshed this season in '
                    'polished black leather. The design adopts a new flat version '
                    'of our houses iconic orb motif, which Vivienne Westwood '
                    'used to represent launching tradition into the future, '
                    'set on top of a leather tab. '
                    '\n'
                    '\n'
                    '• Metal hardware \n'
                    '• Top-handle silhouette\n'
                    '• Base feet \n'
                    '• Tonal stitching \n'
                    '• Curved edges \n'
                    '• Metal hardware \n'
                    '• Two zipped compartments \n'
                    '• More lining \n'
                    '• Gold-tone embossing \n'
                    '\n'
                    'Code: 8050889788164 \n',
              ),
              ProductListView(),
              FooterSection(),
              CopyrightSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.name,
    required this.price,
    required this.warna,
    required this.size,
  }) : super(key: key);

  final String name;
  final String price;
  final String warna;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[500],
                  ),
                ),
                Text(
                  warna,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  size,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.favorite,
            color: Colors.red[500],
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white),
                SizedBox(width: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    Key? key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({Key? key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 500,
      height: 500,
      fit: BoxFit.cover,
    );
  }
}

class CartSection extends StatelessWidget {
  const CartSection({Key? key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: Colors.blue,
            icon: Icons.add_shopping_cart,
            label: 'Add to Cart',
          ),
        ],
      ),
    );
  }
}

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'You May Also Like',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ProductItem(
                imageName: 'images/purse.jpg',
                name: 'Belle Heart Frame Purse',
                price: '\€330',
              ),
              ProductItem(
                imageName: 'images/shoes.jpg',
                name: 'Elevated Ghillie',
                price: '\€850',
              ),
              ProductItem(
                imageName: 'images/bracelet.jpg',
                name: 'New Diamante Heart Bracelet',
                price: '\€110',
              ),
              ProductItem(
                imageName: 'images/boots.jpg',
                name: 'Midas Boot',
                price: '\€880',
              ),
              ProductItem(
                imageName: 'images/ring.jpg',
                name: 'Reina Petite Ring',
                price: '\€110',
              ),
            ].map((productItem) => Expanded(child: productItem)).toList(), // Menggunakan Expanded di sekitar ProductItem
          ),
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageName;
  final String name;
  final String price;

  const ProductItem({
    required this.imageName,
    required this.name,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175, // Lebar maksimum untuk setiap ProductItem
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140, // Lebar gambar
            height: 150, // Tinggi gambar
            child: Image.asset(
              imageName,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer Service',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'FAQs & Contact',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Track Your Order',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Return & Refund',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Legal',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Legal Notice',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Brand Protection',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Us',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Cookie Settings',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Careers',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class CopyrightSection extends StatelessWidget {
  const CopyrightSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook, color: Colors.black),
              SizedBox(width: 16),
              Icon(Icons.tiktok, color: Colors.black),
              SizedBox(width: 16),
              Icon(Icons.wordpress, color: Colors.black),
            ],
          ),
          SizedBox(height: 16),
          Text(
            '© 2024, Vivienne Westwood',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
