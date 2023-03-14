import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String> onChanged;
  final VoidCallback onPressed;
  const SearchWidget(
      {super.key,
      required this.textEditingController,
      required this.onChanged,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: textEditingController,
        onChanged: onChanged,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
          // border: InputBorder.none,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(10),
          hintText: 'Pesquisar...',
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
