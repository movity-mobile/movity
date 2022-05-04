import 'package:flutter/material.dart';
import 'package:movity_app/bloc/theme.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
bool status = true;
class MySwitch extends StatelessWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 70,
              height: 35,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: FlutterSwitch(
                    width: 125.0,
                    height: 55.0,
                    valueFontSize: 25.0,
                    toggleSize: 45.0,
                    value: status,
                    borderRadius: 30.0,
                    padding: 8.0,
                    showOnOff: false,
                    onToggle: (bool position) {
                        context.read<ThemeBloc>().add(SwitchThemeEvent());
                        status = position;
                      },
                    activeIcon: Icon(Icons.wb_sunny, color: Colors.yellow,),
                    activeToggleColor: Colors.black,
                    inactiveColor: Colors.white38,
                    activeColor: Colors.white38,
                    inactiveIcon: Icon(Icons.nightlight, color: Colors.white,),
                    inactiveToggleColor:  Colors.grey.shade900,
                    activeSwitchBorder: Border.all(color: Colors.grey.shade900,width: 3),
                    inactiveSwitchBorder: Border.all(color: Colors.grey.shade900,width: 3),
                  )
                  ))
        ]);
  }
}
