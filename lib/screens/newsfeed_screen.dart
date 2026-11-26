import 'package:flutter/material.dart';
import 'package:estacio_mobprog1/widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: const [
        NewsfeedCard(
          userName: 'Shin Estacio',
          postContent: 'My Book collection is growing! Check out this new addition.',
          date: '1 hr ago',
          numOfLikes: 10500,
          numOfComments: 5078,
          numOfShares: 1907,
          hasImage: true,
          imageUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        ),
        NewsfeedCard(
          userName: 'Maxi Raje',
          postContent: 'Post 2: Flower photo.',
          date: '3 hrs ago',
          numOfLikes: 35,
          numOfComments: 6,
          numOfShares: 2,
          hasImage: true,
          imageUrl:
              'https://images.unsplash.com/photo-1490750967868-88aa4486c946?auto=format&fit=crop&w=800&q=80',
        ),
        NewsfeedCard(
          userName: 'Alex Cruz',
          postContent: 'Post 3: Text-only post with no image.',
          date: 'Yesterday',
          numOfLikes: 12,
          numOfComments: 2,
          numOfShares: 0,
          hasImage: false,
        ),
      ],
    );
  }
}