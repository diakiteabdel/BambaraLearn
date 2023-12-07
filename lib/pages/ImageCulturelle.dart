import 'package:flutter/material.dart';

class ImageItem {
  final String description;
  final String title;
  final String imagePath;

  ImageItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class ImageBankPage extends StatelessWidget {
  final List<ImageItem> images = [
    ImageItem(
      imagePath: 'assets/images/img/img1.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img2.jpeg',
      title: 'La tenue traditionnelle',
      description: 'Portée pour des grandes occasions',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img14.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img4.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img5.webp',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img6.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img7.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img8.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img9.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img10.webp',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img11.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img12.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img13.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img14.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img15.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img16.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img17.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img18.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img19.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img20.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img21.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img22.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img23.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img24.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img25.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img26.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img27.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img28.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img29.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img30.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img31.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img32.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img33.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img34.jpg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img35.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img36.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img37.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img38.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img39.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
    ImageItem(
      imagePath: 'assets/images/img/img40.jpeg',
      title: 'Le Drapeau du MALI',
      description: 'Il représente l\'emblème national',
    ),
  ];

   ImageBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Banque d\'Images Culturelles'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showImagePopup(context, images[index]);
            },
            child: Image.asset(
              images[index].imagePath,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  void _showImagePopup(BuildContext context, ImageItem image) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image.imagePath,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16.0),
              Text(
                image.title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                image.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}
