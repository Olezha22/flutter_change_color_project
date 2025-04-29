import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/home/repository/home_repository.dart';

part 'color_change_event.dart';
part 'color_change_state.dart';

class ColorChangeBloc extends Bloc<ColorChangeEvent, ColorChangeState> {
  final HomeRepository homeRepository;

  ColorChangeBloc({required this.homeRepository})
    : super(const ColorChangeState()) {
    on<StartColorChange>(_onStartColorChange);
    on<FinishColorChange>(_onFinishColorChange);
    on<QuoteLoaded>(_onQuoteLoaded);
  }

  void _onStartColorChange(
    StartColorChange event,
    Emitter<ColorChangeState> emit,
  ) async {
    final color = _generateRandomColor();
    emit(
      state.copyWith(
        targetColor: color,
        status: ColorChangeStatus.animating,
        isAnimating: true,
        tapPosition: event.tapPosition,
      ),
    );

    try {
      final quote = await homeRepository.fetchQuote();
      add(QuoteLoaded(quote));
    } catch (_) {
      // optionally handle error
    }
  }

  void _onFinishColorChange(
    FinishColorChange event,
    Emitter<ColorChangeState> emit,
  ) {
    emit(
      state.copyWith(
        currentColor: state.targetColor,
        status: ColorChangeStatus.success,
        isAnimating: false,
      ),
    );
  }

  void _onQuoteLoaded(QuoteLoaded event, Emitter<ColorChangeState> emit) {
    emit(state.copyWith(text: event.quote, mode: DisplayMode.colorAndText));
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
