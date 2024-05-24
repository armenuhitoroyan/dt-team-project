import 'package:chat_messanger_app/widgets/bloc/slider_bloc.dart';
import 'package:chat_messanger_app/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SliderBloc(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSlider(),
              const SizedBox(height: 10.0),
              AppSlider(),
              const SizedBox(height: 10.0),
              AppSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
