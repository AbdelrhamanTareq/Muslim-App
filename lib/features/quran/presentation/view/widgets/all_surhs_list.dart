import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/quran/presentation/logic/cubit/quran_settings_cubit/quran_settings_cubit.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../logic/cubit/quran_cubit/quran_cubit.dart';
import '../quran_shrah_details.dart';

class AllSurhsList extends StatelessWidget {
  const AllSurhsList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final QuranGetAllDataSucces state;

  @override
  Widget build(BuildContext context) {
    var data = state.data;
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var bodyMedium2 = Theme.of(context).textTheme.bodyMedium!
            // .copyWith(color: AppColors.black)
            ;
        var listData = data[index];
        return Container(
          padding: const EdgeInsets.all(8.0),
          // color: (index % 2 == 0)
          //     ? AppColors.quranBackground
          //     : AppColors.quranBackgroundAppBar,
          child: InkWell(
            onTap: () {
              // save surha name
              BlocProvider.of<QuranSettingsCubit>(context)
                  .updateLastRead(data[index].name);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuranSurahDetails(
                      index: index,
                      data: data,
                    ),
                  ));
            },
            child: ListTile(
              leading: Text(
                "${index + 1}) ${listData.name}",
                style: bodyMedium2,
              ),
              trailing: FittedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(AppStrings.noOfAyat, style: bodyMedium2),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          listData.array.length.toString(),
                          style: bodyMedium2,
                        )
                      ],
                    ),
                    Text(
                      (listData.type).toString(),
                      style: bodyMedium2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
