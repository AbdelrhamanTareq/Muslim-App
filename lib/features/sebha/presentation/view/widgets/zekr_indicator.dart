import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/sebha/presentation/logic/cubit/sebha_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ZekrIndictor extends StatelessWidget {
  const ZekrIndictor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SebhaCubit, SebhaState>(
      builder: (context, state) {
        return CircularPercentIndicator(
          progressColor: Colors.amber,
          radius: 100.0,
          lineWidth: 10.0,
          percent: state.initValue / state.maxValue,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                state.initValue.toInt().toString(),
                style: const TextStyle(
                    fontSize: 35, color: Colors.white, fontFamily: "DS-DIGI"),
              ),
              const Divider(
                thickness: 2,
              ),
              InkWell(
                onTap: () async {
                  final resulat = await showDialog(
                    context: context,
                    builder: (context) {
                      return const ZekerCountWidget();
                    },
                  );
                  BlocProvider.of<SebhaCubit>(context).changeMaxValue(
                      (resulat != null)
                          ? double.tryParse(resulat) ?? 0
                          : state.maxValue);
                },
                child: Text(
                  state.maxValue.toInt().toString(),
                  style: const TextStyle(
                      fontSize: 35, color: Colors.white, fontFamily: "DS-DIGI"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ZekerCountWidget extends StatelessWidget {
  const ZekerCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final TextEditingController controller = TextEditingController();
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ادخل العدد المطلوب",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              //  controller: controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "ادخل العدد المطلوب",
              ),
              // onEditingComplete:()=> Navigator.pop(context),
              onSubmitted: (value) => Navigator.pop(context, value),
            ),
          ],
        ),
      ),
    );
  }
}
