import '../components/toistot_talteen_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../register_page/register_page_widget.dart';
import '../sign_in_page/sign_in_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterOrSignInPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for ToistotTalteen component.
  late ToistotTalteenModel toistotTalteenModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    toistotTalteenModel = createModel(context, () => ToistotTalteenModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
