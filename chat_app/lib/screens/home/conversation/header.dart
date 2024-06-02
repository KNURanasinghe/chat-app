import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_Providers.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Chat app",
              style: TextStyle(
                fontSize: 28,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Provider.of<AuthProviders>(context, listen: false)
                    .userSignOut();
              },
              child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      Provider.of<AuthProviders>(context).user!.photoURL!)),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
