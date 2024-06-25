import 'package:flutter/material.dart';
import '../../widgets/text_input_field.dart';

class SearchWidget extends StatefulWidget {
  final Function(String) onSearchQueryChanged;

  const SearchWidget({
    super.key,
    required this.onSearchQueryChanged,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      widget.onSearchQueryChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextInputField(
      controller: _controller,
      isError: false,
      label: "Search",
      keyboardType: TextInputType.none,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
