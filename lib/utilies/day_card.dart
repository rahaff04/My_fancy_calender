import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/app_theme.dart';
import '../utilies/add_button.dart';


class DayCard extends StatelessWidget {
  const DayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  DottedBorder(
      color: MyTheme.pastelPink,
      strokeWidth: 3,
      dashPattern: const [6, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(14),

      child: Container(
        padding: EdgeInsets.all(10),
        width: 188,
        height: 148,
        decoration: BoxDecoration(
          color: MyTheme.blushPink,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: MyTheme.pastelPink,
              blurRadius: 12.4,
              offset: Offset(7, 7),
            ),],
        ),
        child: Column(
          children: [
            Text(
              'There is no plan for this day',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
            AddButton(),
            SizedBox(height: 6),
            Text(
              'Add new plans',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
