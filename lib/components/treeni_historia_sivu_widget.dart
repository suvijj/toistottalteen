import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini_widget.dart';
import '/components/treeni_rutiini_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'treeni_historia_sivu_model.dart';
export 'treeni_historia_sivu_model.dart';

class TreeniHistoriaSivuWidget extends StatefulWidget {
  const TreeniHistoriaSivuWidget({
    Key? key,
    this.appData,
  }) : super(key: key);

  final AppDataRecord? appData;

  @override
  _TreeniHistoriaSivuWidgetState createState() =>
      _TreeniHistoriaSivuWidgetState();
}

class _TreeniHistoriaSivuWidgetState extends State<TreeniHistoriaSivuWidget> {
  late TreeniHistoriaSivuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TreeniHistoriaSivuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<TreeniSessiotRecord>>(
      stream: queryTreeniSessiotRecord(
        queryBuilder: (treeniSessiotRecord) => treeniSessiotRecord
            .where('userRef', isEqualTo: currentUserReference)
            .orderBy('alku'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<TreeniSessiotRecord> containerTreeniSessiotRecordList =
            snapshot.data!;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 150),
                  child: Builder(
                    builder: (context) {
                      final treeniSessio =
                          containerTreeniSessiotRecordList.toList();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(treeniSessio.length,
                              (treeniSessioIndex) {
                            final treeniSessioItem =
                                treeniSessio[treeniSessioIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                              child: wrapWithModel(
                                model: _model.treeniRutiiniModels.getModel(
                                  treeniSessioItem.reference.id,
                                  treeniSessioIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: TreeniRutiiniWidget(
                                  key: Key(
                                    'Key1od_${treeniSessioItem.reference.id}',
                                  ),
                                  treeniRutiini: null,
                                  treeniSessio: treeniSessioItem,
                                  appData: widget.appData,
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                if (containerTreeniSessiotRecordList.length == 0)
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'yozizy8i' /* Sinulla ei ole vielä tehtyjä t... */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: wrapWithModel(
                            model: _model.buttonAloitaTreenaaminenModel,
                            updateCallback: () => setState(() {}),
                            child: ButtonAloitaTreenaaminenWidget(
                              userAppData: widget.appData,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: wrapWithModel(
                            model: _model.buttonLuoRutiiniModel,
                            updateCallback: () => setState(() {}),
                            child: ButtonLuoRutiiniWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}