import 'package:flutter/material.dart';
import 'package:belajar_flutter/list/detailScreen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  final List<Map<String, String>> articles = const [
    {
      'title': 'Flutter Dasar 1',
      'description': 'Belajar dasar-dasar flutter',
      'image': 'https://piscum.photos/100/300?1',
    },
    {
      'title': 'State Management 1',
      'description': 'Get X, Provider, Bloc, dll',
      'image': 'https://piscum.photos/100/300?2',
    },
    {
      'title': 'Flutter Dasar 2',
      'description': 'Belajar dasar-dasar flutter bagian 2',
      'image': 'https://piscum.photos/100/300?1',
    },
    {
      'title': 'State Management 2',
      'description': 'Get X, Provider, Bloc, dll',
      'image': 'https://piscum.photos/100/300?2',
    },
    {
      'title': 'Flutter Dasar 3',
      'description': 'Belajar dasar-dasar flutter bagian 3',
      'image': 'https://piscum.photos/100/300?1',
    },
    {
      'title': 'State Management 3',
      'description': 'Get X, Provider, Bloc, dll',
      'image': 'https://piscum.photos/100/300?2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ArticleDetailScreen(data: article),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 5),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(article['image']!),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          article['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          article['description']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}