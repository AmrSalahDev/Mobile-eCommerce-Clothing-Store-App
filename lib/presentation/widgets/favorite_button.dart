import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final Color heartColor;
  final double size;
  final bool isFavorited;
  final Color backgroundColor;
  final ValueChanged<bool> onToggle;
  final bool showBackground;
  final double padding;

  const FavoriteButton({
    super.key,
    required this.heartColor,
    required this.size,
    required this.isFavorited,
    required this.onToggle,
    this.showBackground = true, required this.backgroundColor,
    this.padding = 10,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late bool isFavorite;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorited;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.4,
    ).chain(CurveTween(curve: Curves.easeOut)).animate(_controller);
  }

  void _onTap() {
    final newValue = !isFavorite;

    if (newValue) {
      _controller.forward().then((_) => _controller.reverse());
    } else {
      _controller.reverse();
    }

    setState(() {
      isFavorite = newValue;
    });

    widget.onToggle(newValue);
  }

  @override
  void didUpdateWidget(covariant FavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFavorited != oldWidget.isFavorited) {
      isFavorite = widget.isFavorited;
    }
  }

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      isFavorite ? Icons.favorite : Icons.favorite_outline,
      color: widget.heartColor,
      size: widget.size,
    );

    return GestureDetector(
      onTap: _onTap,
      child: widget.showBackground
          ? Container(
              padding: EdgeInsets.all(widget.padding),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.backgroundColor,
              ),
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: icon,
              ),
            )
          : ScaleTransition(
              scale: _scaleAnimation,
              child: icon,
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
