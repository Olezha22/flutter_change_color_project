part of 'color_change_bloc.dart';

sealed class ColorChangeEvent extends Equatable {
  const ColorChangeEvent();

  @override
  List<Object?> get props => [];
}

class StartColorChange extends ColorChangeEvent {
  final Offset tapPosition;

  const StartColorChange(this.tapPosition);
}

final class FinishColorChange extends ColorChangeEvent {}

final class QuoteLoaded extends ColorChangeEvent {
  final String quote;
  const QuoteLoaded(this.quote);

  @override
  List<Object?> get props => [quote];
}
