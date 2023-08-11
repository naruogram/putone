import 'package:flutter/material.dart';

class MovieIndicator extends StatefulWidget {
  final int? index;
  const MovieIndicator({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<MovieIndicator> createState() => _MovieIndicatorState();
}

class _MovieIndicatorState extends State<MovieIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        if (selectedIndex != widget.index && widget.index != null) {
          setState(() {
            selectedIndex = widget.index!;
          });
          _controller.reset();
          _controller.repeat();
        }
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
