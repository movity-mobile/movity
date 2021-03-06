import 'package:movity_app/bloc/genre.bloc.dart';
import 'package:movity_app/bloc/movies.bloc.dart';
import 'package:movity_app/bloc/theme.bloc.dart';
import 'package:movity_app/pages/root.view.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()=> runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>ThemeBloc(),),
          BlocProvider(create: (context)=>MovieBloc(),),
          BlocProvider(create: (context)=>GenreBloc(),),
          ],
        child: const RootView(),

    );


  }
}



