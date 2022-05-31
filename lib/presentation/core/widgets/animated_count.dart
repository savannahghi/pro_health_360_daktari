import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget {
  const AnimatedCount({
    required this.count,
    required Duration duration,
    Curve curve = Curves.linear,
  }) : super(duration: duration, curve: curve);

  final int count;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCountState();
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween? _count;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _count = visitor(
      _count,
      widget.count,
      (dynamic value) => IntTween(begin: value as int),
    )! as IntTween;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          const TextSpan(text: 'You can request for another OTP in '),
          TextSpan(
            text: _count!.evaluate(animation).toString(),
            style: heavySize14Text(Colors.black),
          ),
        ],
      ),
    );
  }
}
