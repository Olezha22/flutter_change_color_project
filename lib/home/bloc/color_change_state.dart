part of 'color_change_bloc.dart';

enum ColorChangeStatus {
  initial,
  loading,
  success,
  animating,
  colorChanging,
  error,
}

extension ColorChangeStatusX on ColorChangeStatus {
  bool get isInitial => this == ColorChangeStatus.initial;
  bool get isLoading => this == ColorChangeStatus.loading;
  bool get isSuccess => this == ColorChangeStatus.success;
  bool get isAnimating => this == ColorChangeStatus.animating;
  bool get isColorChanging => this == ColorChangeStatus.colorChanging;
  bool get isError => this == ColorChangeStatus.error;
}

enum DisplayMode { textOnly, colorAndText }

extension DisplayModeX on DisplayMode {
  bool get isTextOnly => this == DisplayMode.textOnly;
  bool get isColorAndText => this == DisplayMode.colorAndText;
}

class ColorChangeState extends Equatable {
  final ColorChangeStatus status;
  final DisplayMode mode;
  final Color currentColor;
  final Color targetColor;
  final String text;
  final String message;
  final bool isAnimating;
  final Offset tapPosition;
  const ColorChangeState({
    this.status = ColorChangeStatus.initial,
    this.mode = DisplayMode.colorAndText,
    this.currentColor = Colors.white,
    this.targetColor = Colors.white,
    this.text = 'Did you know that..',
    this.isAnimating = false,
    this.message = '',
    this.tapPosition = Offset.zero,
  });

  ColorChangeState copyWith({
    ColorChangeStatus? status,
    DisplayMode? mode,
    Color? currentColor,
    Color? targetColor,
    String? text,
    bool? isAnimating,
    Offset? tapPosition,
    String? message,
  }) {
    return ColorChangeState(
      status: status ?? this.status,
      mode: mode ?? this.mode,
      currentColor: currentColor ?? this.currentColor,
      targetColor: targetColor ?? this.targetColor,
      text: text ?? this.text,
      message: message ?? this.message,
      isAnimating: isAnimating ?? this.isAnimating,
      tapPosition: tapPosition ?? this.tapPosition,
    );
  }

  @override
  List<Object?> get props => [
    status,
    mode,
    targetColor,
    currentColor,
    text,
    isAnimating,
    tapPosition,
    message,
  ];
}
