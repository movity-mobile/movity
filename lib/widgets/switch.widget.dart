import 'package:flutter/material.dart';
import 'package:movity_app/bloc/theme.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 90,
              height: 35,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: LiteRollingSwitch(
                    value: true,
                    textOn: "Light",
                    textOff: "Dark",
                    colorOn: Colors.grey.shade500,
                    colorOff: Colors.grey.shade900,
                    iconOn: Icons.wb_sunny,
                    iconOff: Icons.nightlight,
                    textSize: 18.0,
                    onChanged: (bool position) {
                      context.read<ThemeBloc>().add(SwitchThemeEvent());
                    },
                  )))
        ]);
  }
}