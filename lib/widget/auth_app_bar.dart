import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLogin;
  final VoidCallback onBack;
  final VoidCallback onClose;

  const AuthAppBar({
    super.key,
    required this.isLogin,
    required this.onBack,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: isLogin ? onBack : onClose,
        icon: Icon(isLogin ? Icons.menu : Icons.close),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isLogin) ...[
            const Icon(Icons.flash_on, color: Color(0xFFAFA2FF)),
            const SizedBox(width: 4),
          ],
          Text(
            isLogin ? 'Tixora' : 'Electric Pulse',
            style: TextStyle(
              color: isLogin ? const Color(0xFF9070E0) : Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        if (isLogin)
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(31, 78, 226, 209),
              child: Icon(Icons.person, color: Color(0xFF4EE2D1)),
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}