import 'package:flutter/material.dart';
import 'package:telegram_clone_app/theme/constants/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required this.leadingOnPressed,
    this.titel,
    this.leading,
    required this.actionIcon,
    this.hasDescription=false, this.description ,
  });

  final String? titel;
  final Widget? leading;
  final Function()? leadingOnPressed;
  final Widget actionIcon;
  final bool hasDescription;
  final Widget? description;
  

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      excludeHeaderSemantics: false,
      backgroundColor: greyColor,
      title: Column(
        children: [
          Text(
            widget.titel!,
            style: const TextStyle(color: Colors.white),
          ),
          if(widget.hasDescription) widget.description!
        ],
      ),
      leading:
          IconButton(onPressed: widget.leadingOnPressed, icon: widget.leading!),
      actions: [
        IconButton(
          onPressed: null,
          icon: widget.actionIcon,
        ),
      ],
    );
  }
}
