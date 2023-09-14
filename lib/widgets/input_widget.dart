import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VTextFieldController extends TextEditingController {
  VTextFieldController();

  final FocusNode focusNode = FocusNode();
  String? errorText;

  void requestFocus() {
    try {
      focusNode.requestFocus();
    } catch (e) {
      // Let this empty
    }
  }

  Future<void> setError(String? message) async {
    errorText = message;
    notifyListeners();
  }

  Future<void> setText(String text) async {
    this.text = text;
    notifyListeners();
  }
}

class VTextField extends StatefulWidget {
  const VTextField({
    Key? key,
    this.controller,
    this.value,
    this.hint,
    this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  final VTextFieldController? controller;
  final String? value;
  final String? hint;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  @override
  VTextFieldState createState() => VTextFieldState();
}

class VTextFieldState extends State<VTextField> {
  TextEditingController? controller;

  FocusNode? focusNode;
  String? errorText;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.value);
    try {
      focusNode =
          widget.controller?.focusNode ?? widget.focusNode ?? FocusNode();
      if (focusNode != null) {
        try {
          focusNode?.addListener(notify);
        } catch (e) {
          // Let this empty
        }
      }
    } catch (e) {
      Get.log('VTextFieldState initState Error: \n$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          if (widget.labelText != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: Text(widget.labelText!),
              ),
            ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF333333),
                  width: 1,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              filled: true,
              fillColor: const Color(0xFFEEEEEE),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              hintText: widget.hint,
              hintStyle: const TextStyle(fontSize: 14),
              errorText: null,
              errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red[700] ?? Colors.red,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red[700] ?? Colors.red,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: widget.validator,
          ),
        ],
      ),
    );
  }

  // when change in the textfield
  void onChanged(String value) {
    notify();
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  // Updating the view
  void notify() {
    if (mounted) {
      setState(() {});
    }
  }
}
