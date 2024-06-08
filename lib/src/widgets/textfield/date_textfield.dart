import 'package:intl/intl.dart';
import 'package:rccg_jp/lib.dart';

class DateTextField extends StatefulWidget {
  final TextEditingController date;
  final String hintText;

  const DateTextField({super.key, required this.date, required this.hintText});

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  @override
  void initState() {
    widget.date.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.date,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Donation date is required';
        }
        return null;
      },
      decoration: InputDecoration(
          //helperText: '',
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.only(left: 8)),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2024),
            lastDate: DateTime.now());

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          setState(() {
            widget.date.text = formattedDate;
          });
        } else {}
      },
    );
  }
}
