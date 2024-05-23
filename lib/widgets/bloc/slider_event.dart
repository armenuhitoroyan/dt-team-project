import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class SelectMenuItemEvent extends SliderEvent {
  final int index;

  const SelectMenuItemEvent(this.index);
}

class SelectDropdownItemEvent extends SliderEvent {
  final String item;

  SelectDropdownItemEvent(this.item);
}

class ChangeColor extends SliderEvent {
  bool isChanged;

  ChangeColor(this.isChanged);
}

class DetermineTheSize extends SliderEvent {
  double direction;

  DetermineTheSize(this.direction);
}

class UpdateTheWidth extends SliderEvent {
  double width;
  double screenWidth;

  UpdateTheWidth(this.width, this.screenWidth);
}

class ChangeSlideColor extends SliderEvent {
  ChangeSlideColor();
}
