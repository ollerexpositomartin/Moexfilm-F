import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moexfilm/config/app_color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ButtonProfile extends StatelessWidget {
  const ButtonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.ACCENT_COLOR, width: 3)),
        width: 65,
        height: 65,
        child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              context.push("/profile");
            },
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage(Supabase.instance.client.auth
                          .currentUser?.userMetadata!["avatar_url"]),
                      fit: BoxFit.fill)),
            )),
      ),
    );
  }
}
