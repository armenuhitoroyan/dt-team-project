import 'package:chat_messanger_app/widgets/bloc/slider_event.dart';
import 'package:chat_messanger_app/widgets/bloc/slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  bool onOff = false;
  double? direction;
  double? width;
  double? value;
  double? percent;
  double? contWidth;

  SliderBloc() : super(SliderState()) {
    on<SelectMenuItemEvent>(_selectMenuItem);
    on<SelectDropdownItemEvent>(_selectDropdownItemEvent);
    on<ChangeColor>(_changeColorEvent);
    on<DetermineTheSize>(_onDetermineSize);
    on<UpdateTheWidth>(_onUpdateWidth);
    on<ChangeSlideColor>(_onChangeColorEvent);
  }

  _selectMenuItem(SelectMenuItemEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }

  _selectDropdownItemEvent(
      SelectDropdownItemEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(dropdownvalue: event.item));
  }

  _changeColorEvent(ChangeColor event, Emitter<SliderState> emit) {
    onOff = !onOff;
    emit(state.copyWith(onOff: onOff));
  }

  _onDetermineSize(DetermineTheSize event, Emitter<SliderState> emit) {
    if (event.direction < 0) {
      direction = 0;
    }
    emit(state.copyWith(index: direction));
  }

  _onUpdateWidth(UpdateTheWidth event, Emitter<SliderState> emit) {
    if (event.width > 0) {
      contWidth = event.screenWidth - 30;
      value = event.width - 1;

      percent = ((100 * value!) / contWidth! - 1).clamp(0, 100);
    } else if (event.width < 0) {
      value = 0;
    }

    emit(
        state.copyWith(index: value, screenWidth: contWidth, percent: percent));
  }

  _onChangeColorEvent(ChangeSlideColor event, Emitter<SliderState> emit) {
    emit(state.copyWith(isStarted: true, width: 0));
  }
}
