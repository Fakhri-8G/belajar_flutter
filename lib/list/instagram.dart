import 'package:flutter/material.dart';

class Instagram extends StatelessWidget {
  Instagram({super.key});

  // Data sumber (Dummy Data) untuk Stories dan Postingan Feed
  final List<Map<String, String>> items = [
    {
      'image': 'https://picsum.photos/seed/nature/300/300',
      'name': 'Nature',
      'description': 'Nature refers to the natural, physical, or material world and life in general.',
    },
    {
      'image': 'https://picsum.photos/seed/mountain/300/300',
      'name': 'Mountain',
      'description': 'A mountain is a large landform that rises prominently above its surroundings, typically forming a peak.',
    },
    {
      'image': 'https://picsum.photos/seed/Sea/300/300',
      'name': 'Sea',
      'description': 'A sea is a large body of saltwater that is partially or fully surrounded by land.',
    },
    {
      'image': 'https://picsum.photos/seed/forest/300/300',
      'name': 'Forest',
      'description': 'A forest is a large area of land covered mostly by trees and other plants.',
    },
    {
      'image': 'https://picsum.photos/seed/nature/300/300',
      'name': 'Nature',
      'description': 'Nature refers to the natural, physical, or material world and life in general.',
    },
    {
      'image': 'https://picsum.photos/seed/mountain/300/300',
      'name': 'Mountain',
      'description': 'A mountain is a large landform that rises prominently above its surroundings, typically forming a peak.',
    },
    {
      'image': 'https://picsum.photos/seed/Sea/300/300',
      'name': 'Sea',
      'description': 'A sea is a large body of saltwater that is partially or fully surrounded by land.',
    },
    {
      'image': 'https://picsum.photos/seed/forest/300/300',
      'name': 'Forest',
      'description': 'A forest is a large area of land covered mostly by trees and other plants.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // 1. APPBAR (Bagian atas aplikasi Instagram)
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(icon: Icon(Icons.add_box_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.send_outlined), onPressed: () {}),
        ],
      ),

      // 2. BODY UTAMA (Disusun dari atas ke bawah pakai Column)
      body: Column(
        children: [
          // BAGIAN A: STORIES (ListView Horizontal / Menyamping)
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(items[index]['image']!),
                      ),
                      SizedBox(height: 5),
                      Text(
                        items[index]['name']!,
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          
          Divider(height: 1, color: Colors.grey[300]),

          // BAGIAN B: FEED POSTINGAN (ListView Vertical / Memanjang ke bawah)
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Post (Foto profil & Nama akun)
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(items[index]['image']!),
                          ),
                          SizedBox(width: 10),
                          Text(
                            items[index]['name']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(Icons.more_vert),
                        ],
                      ),
                    ),

                    // Gambar Postingan Utama
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.network(
                        items[index]['image']!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                          );
                        },
                      ),
                    ),

                    // Tombol Aksi (Like, Comment, Share, Bookmark)
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite_border, size: 28),
                              SizedBox(width: 15),
                              Icon(Icons.mode_comment_outlined, size: 28),
                              SizedBox(width: 15),
                              Icon(Icons.send_outlined, size: 28),
                            ],
                          ),
                          Icon(Icons.bookmark_border, size: 28),
                        ],
                      ),
                    ),

                    // Bagian Suka & Keterangan (Caption)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1.000 suka',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: '${items[index]['name']} ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: items[index]['description']!,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20), // Jarak pemisah antar postingan
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}