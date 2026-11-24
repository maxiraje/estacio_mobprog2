import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:estacio_mobprog1/constant.dart';
import 'package:estacio_mobprog1/widgets/custom_text.dart';

class NewsfeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int? postNumber;
  final int? numOfLikes;
  final int? numOfComments;
  final int? numOfShares;
  final bool? hasImage;
  final bool? hasPlaceholder;
  final String? imageUrl;
  final bool? hasSecondaryImage;
  final String? secondaryImageUrl;

  static const String _defaultFlowerUrl =
      'https://images.unsplash.com/photo-1490750967868-88aa4486c946?auto=format&fit=crop&w=800&q=80';

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.postNumber,
    this.numOfLikes,
    this.numOfComments,
    this.numOfShares,
    this.hasImage,
    this.hasPlaceholder,
    this.imageUrl,
    this.hasSecondaryImage,
    this.secondaryImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenUtilSp = ScreenUtil().setSp(10);
    final screenUtilWidth = ScreenUtil().setWidth(10);
    final screenUtilFontUserNameSize = ScreenUtil().setSp(15);
    final screenUtilIconSize = ScreenUtil().setSp(15);

    return Card(
      margin: EdgeInsets.all(screenUtilSp),
      child: Padding(
        padding: EdgeInsets.all(screenUtilSp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.person),
                SizedBox(width: screenUtilWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: userName,
                          fontSize: screenUtilFontUserNameSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        if (postNumber != null) ...[
                          SizedBox(width: ScreenUtil().setWidth(6)),
                          CustomText(
                            text: '#$postNumber',
                            fontSize: ScreenUtil().setSp(12),
                            color: fbPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: screenUtilIconSize,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            if (hasPlaceholder == true) ...[
              Container(
                height: ScreenUtil().setHeight(150),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(ScreenUtil().setSp(8)),
                  ),
                ),
                alignment: Alignment.center,
                child: CustomText(
                  text: 'Post Placeholder',
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.grey[700] ?? Colors.grey,
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
            ],
            if (hasImage == true) ...[
              Image(
                image: NetworkImage(
                  imageUrl ??
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
            ],
            if (hasSecondaryImage == true) ...[
              Image(
                image: NetworkImage(
                  secondaryImageUrl ?? _defaultFlowerUrl,
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up, color: fbPrimary),
                  label: CustomText(
                    text: (numOfLikes ?? 0).toString(),
                    fontSize: ScreenUtil().setSp(12),
                    color: fbDarkPrimary,
                  ),
                ),
                CustomText(
                  text: 'Comment (${numOfComments ?? 0})',
                  fontSize: ScreenUtil().setSp(12),
                  color: fbDarkPrimary,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.redo, color: fbDarkPrimary),
                  label: CustomText(
                    text: 'Share (${numOfShares ?? 0})',
                    fontSize: ScreenUtil().setSp(12),
                    color: fbDarkPrimary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.person),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Container(
                  padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(10),
                    0,
                    0,
                    0,
                  ),
                  alignment: Alignment.centerLeft,
                  height: ScreenUtil().setHeight(25),
                  width: ScreenUtil().setWidth(330),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil().setSp(10)),
                    ),
                  ),
                  child: CustomText(
                    text: 'Write a comment...',
                    fontSize: ScreenUtil().setSp(11),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View all comments (${numOfComments ?? 0})',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}