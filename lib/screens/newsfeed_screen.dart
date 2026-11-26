import 'package:flutter/material.dart';
import 'package:estacio_mobprog1/widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  String? get M => null;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const NewsfeedCard(
          userName: 'Steve Rogers',
          postContent: 'I can do this all day! #AvengersAssemble',
          date: '2 hours ago',
          numOfLikes: 10,
        ),
        const NewsfeedCard(
          userName: 'Tony Stark',
          postContent: 'I am Iron Man. #GeniusBillionairePlayboyPhilanthropist',
          date: 'December 1, 2023',
          numOfLikes: 3000,
          hasImage: true,
        ),
        const NewsfeedCard(
          userName: 'ShinRuz',
          postContent: 'My first post!',
          date: 'November 24,2026',
          numOfLikes: 10,
          hasImage: true,
        ),
      ],
    );
  }
}