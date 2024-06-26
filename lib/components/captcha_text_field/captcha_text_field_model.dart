import '/flutter_flow/flutter_flow_util.dart';
import 'captcha_text_field_widget.dart' show CaptchaTextFieldWidget;
import 'package:flutter/material.dart';

class CaptchaTextFieldModel extends FlutterFlowModel<CaptchaTextFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
