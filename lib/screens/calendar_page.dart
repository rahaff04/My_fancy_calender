import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import '../utilies/pixel_button.dart';
import '../utilies/add_button.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  DateTime _focusedDate = DateTime.now();

  DateTime _selectedDate = DateTime.now();

  final List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  final List<String> _daysOfWeek = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  //to change the month
  void monthChange(int increment)
  {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + increment, 1);
    });
  }

  @override
  Widget build(BuildContext context){
    
    final int dayInMonth = DateUtils.getDaysInMonth(_focusedDate.year, _focusedDate.month);
    final int firstWeekday = DateTime(_focusedDate.year, _focusedDate.month, 1).weekday%7;


    return Scaffold(
      backgroundColor: MyTheme.softLavender,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
            'My calendar',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: MyTheme.pastelLavender,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: MyTheme.pixelOutline, width: 2.4),
                  boxShadow: const [
                  BoxShadow(
                      color: MyTheme.pastelPink,
                      blurRadius: 6.5,
                      offset: Offset(7, 6),
                ),],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    //back one month
                    PixelButton(
                      icon: Icons.chevron_left,
                       onTap: () => monthChange(-1)
                    ),


                    //view the date
                    Text(
                      '${_months[_focusedDate.month - 1]} ${_focusedDate.year}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    //next month
                    PixelButton(
                        icon: Icons.chevron_right , 
                        onTap: () => monthChange(1))
                  ],
                ),
              ),

              const SizedBox(height: 16.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _daysOfWeek.map((day){
                  return SizedBox(
                    width: 30,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 12.0),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dayInMonth + firstWeekday,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6
                ),
                itemBuilder: (context, index){

                  if(index < firstWeekday)
                    {
                      return const SizedBox();
                    }
                  final dayNumber = index - firstWeekday + 1;
                  final cellDate = DateTime(_focusedDate.year, _focusedDate.month, dayNumber);

                  final now = DateTime.now();

                  final isSelected = cellDate.year == _selectedDate.year &&
                      cellDate.month == _selectedDate.month &&
                      cellDate.day == _selectedDate.day;

                  //current date

                  final isToday = cellDate.year == now.year &&
                      cellDate.month == now.month &&
                      cellDate.day == now.day;

                  Color cellColor;
                  Border cellBorder;

                  if (isSelected) {
                    cellColor = MyTheme.mediumPurple;
                    cellBorder = Border.all(color: MyTheme.pixelOutline, width: 2);
                  } else if (isToday) {
                    cellColor = MyTheme.softPink;
                    cellBorder = Border.all(color: MyTheme.pastelPink, width: 2);
                  } else {
                    cellColor = MyTheme.pastelLavender.withOpacity(0.4);
                    cellBorder = Border.all(color: Colors.transparent);
                  }


                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = cellDate;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(color: cellColor,
                        borderRadius: BorderRadius.circular(4),
                        border: cellBorder,
                      ),

                      child: Center(
                        child: Text(
                          '$dayNumber',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: isSelected ? Colors.white : MyTheme.darkText,
                              fontWeight: (isSelected || isToday) ? FontWeight.bold : FontWeight.normal,
                            )
                        ),
                      ),
                    )
                  );
                },
              ),

              const SizedBox(height: 10.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Image.network(
                      'https://media.tenor.com/OxiWDdNREpsAAAAi/pixel-pixel-art.gif',
                      width: 139, height: 139,
                    ),
                  ),

                  SizedBox(width: 33),

                  DottedBorder(
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
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }

}