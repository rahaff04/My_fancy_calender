import 'package:flutter/material.dart';
import '../theme/app_theme.dart';


class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only( top: 11),
      child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: (){},
          child: Icon(Icons.add, color: MyTheme.darkText),
      ),
    );
  }
}
