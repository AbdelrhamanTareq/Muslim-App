import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/utils/app_extensions.dart';

class FavoriteItemContainer extends StatelessWidget {
  const FavoriteItemContainer({
    super.key,
    // required this.color,
    required this.text,
    required this.iconPath,
    required this.routeName,
  });

  // final Color color;
  final String text;
  final String iconPath;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomRight,
      width: containerWidth,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // color: color,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SvgPicture.asset(
              iconPath,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                color: Colors.black26,
              ),
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      iconPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: context.whiteLightColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
