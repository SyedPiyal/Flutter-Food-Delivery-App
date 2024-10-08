import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/constants.dart';
import '../../auth/sign_in_screen.dart';
import '../order_history_screen.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding),
              Text("Account Settings",
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(
                "Update your order details.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ProfileMenuCard(
                svgSrc: "assets/icons/order.svg",
                title: "Your order history",
                subTitle: "Track food delivery status.",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderHistoryScreen(),
                    ),
                  );
                },
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/share.svg",
                title: "Logout",
                subTitle: "click here when you want logout",
                press: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    super.key,
    this.title,
    this.subTitle,
    this.svgSrc,
    this.press,
  });

  final String? title, subTitle, svgSrc;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              SvgPicture.asset(
                svgSrc!,
                height: 24,
                width: 24,
                color: titleColor.withOpacity(0.64),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subTitle!,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: titleColor.withOpacity(0.54),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
