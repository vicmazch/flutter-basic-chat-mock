import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final texCtrl = TextEditingController();
    final focusNode = FocusNode();
    
    final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon:  IconButton(
        onPressed: () {
          final texValue = texCtrl.value.text;
        onValue(texValue);
          texCtrl.clear();
          debugPrint(':::onPressed ...$texValue');
        },
        icon: const Icon( Icons.send_outlined )
      ,)
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: texCtrl,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        texCtrl.clear();
        focusNode.requestFocus();
        onValue(value);
        debugPrint(':::submit value...$value');
      },
      onChanged: (value) {
        debugPrint(':::onChange value...$value');
      },
    );
  }
}