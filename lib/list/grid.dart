import 'package:flutter/material.dart';

class GridProductPage extends StatelessWidget {
  const GridProductPage({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Kaos Putih',
      'price': 'Rp30.000',
      'image': 'https://piscum.photos/100?1',
    },
    {
      'name': 'Jaket Putih',
      'price': 'Rp130.000',
      'image': 'https://piscum.photos/100?2',
    },
    {
      'name': 'Stiker Custom',
      'price': 'Rp10.000',
      'image': 'https://piscum.photos/100?3',
    },
    {
      'name': 'Totebag Imut',
      'price': 'Rp60.000',
      'image': 'https://piscum.photos/100?4',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.6
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey[100],
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 5),
                ],
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(product['image']!, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    right: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product['price']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
      )
    );
  }
}