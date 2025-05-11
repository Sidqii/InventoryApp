import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String boldTitle;
  final VoidCallback? onNotifPressed;

  const CustomAppbar({
    required this.title,
    required this.boldTitle,
    this.onNotifPressed,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      shadowColor: Colors.black.withAlpha(5),
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 1),
          Text(
            boldTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onNotifPressed ?? () {},
          icon: const Icon(
            Icons.notifications_sharp,
          ),
        ),
      ],
    );
  }
}
