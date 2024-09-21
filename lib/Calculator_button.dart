import 'package:flutter/material.dart';

class calculatorButton extends StatelessWidget {
  final String text;
  final Function? onBTNClick;

  const calculatorButton({
    super.key,
    required this.text,
    required this.onBTNClick,
  });



  @override
  Widget build(BuildContext context) {
    return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(onPressed: () {
        onBTNClick!(text);
      },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20))
        ),
          child:
          Text(text,
            style: const TextStyle(
              fontSize: 20,color: Colors.white,
            ),selectionColor: Colors.lightGreen,),
      ),
    )
  );
  }
}
