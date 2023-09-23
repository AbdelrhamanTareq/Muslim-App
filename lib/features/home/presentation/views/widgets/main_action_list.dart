import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_constatnt.dart';
import '../../../../../core/injection_container.dart';
import '../../../../app_drawer/data/local_data/app_drawer_local_data.dart';

class MainActionList extends StatelessWidget {
  const MainActionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //    GoRouter.of(context).push(appScreen[index].path);
              Navigator.of(context).pushNamed(
                appScreen[index].path,
              );
            },
            child: AspectRatio(
              aspectRatio: 0.9,
              child: Container(
                margin: const EdgeInsets.all(16),
                // width: 150,
                // height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: appScreen[index].color,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 25,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              elevation: 10,
                              child: SvgPicture.asset(
                                appScreen[index].iconAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        color: appScreen[index].color,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          appScreen[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.w700,fontSize: instance<AppDrawerLocalData>().getAppTextSize(),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
