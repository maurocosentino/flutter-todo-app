import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  Function(BuildContext) deleteFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.red,

              icon: Icons.delete,

              onPressed: deleteFunction,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue[100],
            border: BorderDirectional(
              bottom: BorderSide(color: Colors.black, width: 4.2),
              top: BorderSide(),
              start: BorderSide(width: 2),
              end: BorderSide(width: 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Colors.black,
                  shape: CircleBorder(),
                  value: taskCompleted,
                  onChanged: onChanged,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: taskCompleted ? Colors.grey[600] : Colors.black,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),

                    child: Text(taskName),
                  ),
                ),
                Icon(Icons.chevron_left, color: Colors.black38, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
