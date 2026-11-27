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
              'https://mir-s3-cdn-cf.behance.net/projects/404/27c699114983891.Y3JvcCwzMTA3LDI0MzAsMCwzMzg.jpg',
        ),
        NewsfeedCard(
          userName: 'Maxi Raje',
          postContent: 'Just finished reading "Our Asymtotic Love Story". What a Hurtful Story!',
          date: '3 hrs ago',
          numOfLikes: 67900,
          numOfComments: 789,
          numOfShares: 2256,
          hasImage: true,
          imageUrl:
              'https://tse4.mm.bing.net/th/id/OIP.3jPEs5ewI_kvmcGoBJjMDAAAAA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        ),
        NewsfeedCard(
          userName: 'Alex Cruz',
          postContent: 'So bored today, I need to find something to do.',
          date: 'Yesterday',
          numOfLikes: 12,
          numOfComments: 2,
          numOfShares: 0,
          hasImage: false,
        ),
        NewsfeedCard(
          userName: 'Alex Cruz',
          postContent: '#LSS A song of the day: "Alice" by GDEE. Such a great song!',
          date: 'Just Now',
          numOfLikes: 18,
          numOfComments: 4,
          numOfShares: 0,
          hasImage: true,
          imageUrl:
              'https://th.bing.com/th/id/OIP.X5fuib-V5194_Uats-QhdwHaD4?w=308&h=180&c=7&r=0&o=7&pid=1.7&rm=3',
        ),
      ],
    );
  }
}