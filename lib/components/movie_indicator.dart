import 'package:flutter/material.dart';

class MovieIndicator extends StatefulWidget {
  const MovieIndicator({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieIndicator> createState() => _MovieIndicatorState();
}

class _MovieIndicatorState extends State<MovieIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: LinearProgressIndicator(
          color: Colors.white,
          backgroundColor: Colors.grey,
          value: _animation.value,
        ),
      ),
    );
  }
}
//   EdgeInsets _getIndicatorPadding({
//     required int index,
//   }) {
//     return EdgeInsets.fromLTRB(
//       (index == 0) ? 0 : (spacing / 2),
//       0,
//       (index == values.length - 1) ? 0 : (spacing / 2),
//       0,
//     );
//   }

//   double _getIndicatorWidth({
//     required int index,
//     required int length,
//     required BoxConstraints constraints,
//   }) {
//     if (index == 0 || index == length - 1) {
//       return (constraints.maxWidth / values.length) - (spacing / 2);
//     }

//     return (constraints.maxWidth / values.length) - (spacing);
//   }
// }
