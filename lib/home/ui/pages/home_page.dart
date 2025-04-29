import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/home/bloc/color_change_bloc.dart';
import 'package:test_project/home/ui/utils/color_utils.dart';
import 'package:test_project/home/ui/widget/animated_color_background.dart';
import 'package:test_project/home/ui/widget/hey_there_text.dart';
import 'package:test_project/home/ui/widget/quote_text.dart';

class ColorChangePage extends StatefulWidget {
  const ColorChangePage({super.key});

  @override
  State<ColorChangePage> createState() => _ColorChangePageState();
}

class _ColorChangePageState extends State<ColorChangePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _radiusAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap(TapUpDetails details, Size screenSize) {
    if (context.read<ColorChangeBloc>().state.isAnimating) return;

    context.read<ColorChangeBloc>().add(
      StartColorChange(details.localPosition),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ColorChangeBloc, ColorChangeState>(
        listenWhen:
            (prev, curr) =>
                prev.status != curr.status &&
                curr.status == ColorChangeStatus.animating,
        listener: (context, state) {
          _controller.forward(from: 0).then((_) {
            context.read<ColorChangeBloc>().add(FinishColorChange());
          });
        },
        child: BlocBuilder<ColorChangeBloc, ColorChangeState>(
          builder: (context, state) {
            final textColor = getTextColorFromBackground(state.targetColor);
            final Size screenSize = MediaQuery.of(context).size;

            return GestureDetector(
              onTapUp: (details) => _handleTap(details, screenSize),
              child: Stack(
                children: [
                  Container(color: state.currentColor),
                  AnimatedColorBackground(
                    radiusAnimation: _radiusAnimation,
                    screenSize: screenSize,
                    tapPosition: state.tapPosition,
                    targetColor: state.targetColor,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeyThereText(
                          heyThereText: 'Hey there',
                          textColor: textColor,
                        ),
                        const SizedBox(height: 20),
                        QuoteText(
                          displayText: state.text,
                          textColor: textColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
