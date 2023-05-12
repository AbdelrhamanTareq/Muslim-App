import 'package:flutter/material.dart';

import '../../../../core/constant/app_constatnt.dart';
import 'widgets/main_header_doaa.dart';

class HomwView extends StatelessWidget {
  const HomwView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedebf2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Column(
        children: [
          const MainHeaderDoaa(),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(16),
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: backgroundColrors[index],
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0.0, 1.0), //(x,y)
                    //     blurRadius: 6.0,
                    //   ),
                    // ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[400],
                            radius: 22,
                            child: Icon(
                              Icons.access_alarms,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            appListStrings[index],
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
