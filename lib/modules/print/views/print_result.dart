import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:gelis/modules/modules.dart';

class PrintResult extends StatelessWidget {
  const PrintResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrintBloc, PrintState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (BuildContext context, PrintState state) {
        return state.print.bytes != null ? PdfPreview(
          allowSharing: false,
          allowPrinting: false,
          initialPageFormat: PdfPageFormat.a4,
          canChangePageFormat: false,
          canChangeOrientation: false,
          build: (format) => state.print.bytes!
        ) : Container();
      }
    );
  }
}
