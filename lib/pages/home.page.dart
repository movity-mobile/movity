import 'package:flutter/material.dart';
import 'package:movity_app/bloc/theme.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../widgets/drawar.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawar(),
        appBar: AppBar(
          title: Text(
            'Movity',
          ),
          actions: [
            Column(
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
                            colorOn: Colors.yellow.shade800,
                            colorOff: Colors.grey.shade900,
                            iconOn: Icons.wb_sunny,
                            iconOff: Icons.nightlight,
                            textSize: 18.0,
                            onChanged: (bool position) {
                              context.read<ThemeBloc>().add(SwitchThemeEvent());
                            },
                          )))
                ]),
          ],
        ),
        body: Center(
            child: Text("Home page",
                style: Theme.of(context).primaryTextTheme.headline6)));
  }
}
