import 'package:flutter/material.dart';
import 'package:movity_app/bloc/theme.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/drawer.widget.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyDrawer(),
        appBar: AppBar(title: Text('Movity',),actions: [
          IconButton(onPressed: (){
            context.read<ThemeBloc>().add(SwitchThemeEvent());
          }, icon: const Icon(Icons.switch_account))
        ],),
        body: Center(
          child: Text("Home page",

              style: TextStyle(fontSize: 60)
        )
    )
    );
  }
}