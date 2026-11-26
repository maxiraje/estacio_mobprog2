import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:estacio_mobprog1/widgets/custom_text.dart';

class NewsfeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int? numOfLikes;
  final bool? hasImage;
  final String? postImagePath;
  final String? avatarPath;

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.postImagePath,
    this.avatarPath,
  });

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  late bool isLiked;
  late int likesCount;

  @override
  void initState() {
    super.initState();
    isLiked = false;
    likesCount = widget.numOfLikes ?? 0;
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likesCount += isLiked ? 1 : -1;
    });
  }

  Widget _buildAvatar() {
    final String profileImg =
        (widget.avatarPath != null && widget.avatarPath!.isNotEmpty)
            ? widget.avatarPath!
            : 'assets/images/iron_man.jpg';

    return CircleAvatar(
      radius: 20.r,
      backgroundImage: AssetImage(profileImg),
    );
  }

  Widget _buildPostImage() {
    final bool showImage = (widget.hasImage ?? false) &&
        widget.postImagePath != null &&
        widget.postImagePath!.isNotEmpty;

    if (!showImage) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.asset(
          widget.postImagePath!,
          width: double.infinity,
          height: 200.h,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildAvatar(),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.userName,
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: widget.date,
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: widget.postContent,
              fontSize: 13.sp,
              color: Colors.black87,
            ),
            _buildPostImage(),
            SizedBox(height: 8.h),
            CustomText(
              text: '$likesCount likes',
              fontSize: 12.sp,
              color: Colors.grey[700] ?? Colors.grey,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  icon: isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                  label: 'Like',
                  isActive: isLiked,
                  onTap: _toggleLike,
                ),
                _ActionButton(
                  icon: Icons.comment_outlined,
                  label: 'Comment',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = isActive ? Colors.blue : Colors.grey[700] ?? Colors.grey;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        child: Row(
          children: [
            Icon(icon, size: 18.sp, color: activeColor),
            SizedBox(width: 6.w),
            CustomText(
              text: label,
              fontSize: 13.sp,
              color: activeColor,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}