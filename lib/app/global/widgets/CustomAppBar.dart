import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String boldTitle;
  final VoidCallback? onNotifPressed;
  final VoidCallback? onTitleTap;
  final bool showNotif;

  const CustomAppbar({
    required this.title,
    required this.boldTitle,
    this.onNotifPressed,
    this.onTitleTap,
    this.showNotif = true,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: onTitleTap ?? () {},
          child: Row(
            children: [
              Text(title, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 1.5),
              Text(
                boldTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: showNotif
            ? [
                IconButton(
                  onPressed: onNotifPressed ?? () {},
                  icon: const Icon(Icons.notifications_sharp),
                ),
              ]
            : null,
      ),
    );
  }
}
