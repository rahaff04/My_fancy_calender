import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        color: MyTheme.pixelOutline,
      ),

      color: MyTheme.lavenderPurple,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: MyTheme.pixelOutline, width: 2),
      ),

      onSelected: (String value)
      {
        switch (value)
        {
          case 'calendar':
            //hdsuh
            break;
          case 'Diary':
            //kmdxsdkxcsd
            break;
        }
      },


      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    PopupMenuItem<String>(
      value: 'home',
      child: Row(
        children: [
          Icon(Icons.home, color: MyTheme.pixelOutline, size: 20),
          const SizedBox(width: 8),
          Text('Home', style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    ),

]
    );
  }
}
