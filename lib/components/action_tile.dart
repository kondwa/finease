import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  const ActionTile(
      {super.key,
      required this.icon,
      required this.labelText,
      required this.onTap});
  final IconData icon;
  final String labelText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        color: Theme.of(context).colorScheme.primaryContainer,
        margin: const EdgeInsets.all(4),
        child: SizedBox(
          height: 120,
          width: 120,
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                icon,
                size: 32,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                labelText,
                textAlign: TextAlign.center,
                softWrap: true,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
