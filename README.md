# estacio_mobprog1

A new Flutter project.

## Lab Activity 1: Discussion

### Integrating `Image` into `newsfeed_card.dart` and Making It Dynamic

To integrate `Image` into `newsfeed_card.dart`, the card accepts optional fields such as `hasImage` (`bool?`), `postImagePath` (`String?`), and `avatarPath` (`String?`). For the user profile area, an `Image` / `CircleAvatar` widget renders the user's avatar image (`AssetImage`), while the post body area uses a conditional helper (`_buildPostImage()`) that returns an `Image.asset(...)` widget styled with `BoxFit.cover` and rounded corners only when `hasImage` is `true` and `postImagePath` is non-empty. When a post does not have an image (`hasImage` is `false` or `null`), the widget returns `SizedBox.shrink()`, allowing text-only posts and image posts to share the same `NewsfeedCard` component cleanly without leaving blank spacing or runtime errors. Additionally, the Like and Comment controls are separated into reusable widget components (`_ActionButton`) that update and display the numeric like count directly.