import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final int selectedIndex;
  String? dropdownvalue;
  bool onOff;
  double index;
  bool isStarted;
  double width;
  double screenWidth;
  double percent;

  SliderState({
    this.selectedIndex = 0,
    this.dropdownvalue,
    this.onOff = false,
    this.isStarted = false,
    this.index = 0,
    this.width = 0,
    this.screenWidth = 0,
    this.percent = 0,
  });

  SliderState copyWith({
    int? selectedIndex,
    String? dropdownvalue,
    bool? onOff,
    bool? isStarted,
    double? index,
    double? width,
    double? screenWidth,
    double? percent,
  }) {
    return SliderState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      dropdownvalue: dropdownvalue ?? this.dropdownvalue,
      onOff: onOff ?? this.onOff,
      isStarted: isStarted ?? this.isStarted,
      index: index ?? this.index,
      width: width ?? this.width,
      screenWidth: screenWidth ?? this.screenWidth,
      percent: percent ?? this.percent,
    );
  }

  @override
  List<Object?> get props => [
        selectedIndex,
        dropdownvalue,
        onOff,
        isStarted,
        index,
        width,
        screenWidth,
        percent
      ];
}
