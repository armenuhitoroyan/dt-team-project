import 'package:chat_messanger_app/config/colors.dart';
import 'package:chat_messanger_app/widgets/bloc/slider_bloc.dart';
import 'package:chat_messanger_app/widgets/bloc/slider_event.dart';
import 'package:chat_messanger_app/widgets/bloc/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSlider extends StatelessWidget {
  bool isChanged = false;
  double direction = 0.0;

  bool isStarted = true;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    double contWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: SizedBox(
                                    width: width > 0 ? width : 0,
                                    height: 30,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.white,
                                            state.onOff
                                                ? AppColors.colorSheme
                                                : Colors.grey
                                          ],
                                          tileMode: TileMode.decal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: GestureDetector(
                                        onHorizontalDragStart:
                                            (DragStartDetails details) => 0,
                                        onHorizontalDragUpdate: (details) {
                                          BlocProvider.of<SliderBloc>(context)
                                              .add(
                                            UpdateTheWidth(
                                                details.globalPosition.dx,
                                                contWidth),
                                          );

                                          direction = details.globalPosition.dx;
                                          state.index = direction;
                                          state.isStarted = isStarted;
                                          width = direction.roundToDouble();
                                          print(state.index);
                                        },
                                        onHorizontalDragEnd: (details) {
                                          // Handle drag end if needed
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: state.onOff
                                                  ? AppColors.colorSheme
                                                  : Colors.grey,
                                              width: 2,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        BlocProvider.of<
                                                                    SliderBloc>(
                                                                context)
                                                            .add(ChangeColor(
                                                                isChanged));
                                                        BlocProvider.of<
                                                                    SliderBloc>(
                                                                context)
                                                            .add(
                                                                ChangeSlideColor());
                                                      },
                                                      child: state.onOff
                                                          ? const Icon(
                                                              Icons.circle,
                                                              color: AppColors
                                                                  .colorSheme,
                                                            )
                                                          : const Icon(
                                                              Icons
                                                                  .circle_outlined,
                                                              color: AppColors
                                                                  .grey,
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
