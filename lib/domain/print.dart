import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class PrintService {
  final List<Map<String, String>>? wo;
  final List<Map<String, String>>? member;
  final List<Map<String, String>>? support;
  final List<Map<String, String>>? sampling;
  final List<Map<String, String>>? test;
  final List<Map<String, String>>? plate;

  const PrintService({this.wo, this.member, this.support, this.sampling, this.test, this.plate});

  Future<Uint8List> create() async {
    final sans = await rootBundle.load('assets/fonts/OpenSans-Regular.ttf');
    final sansttf = pw.Font.ttf(sans);

    final logo = await rootBundle.load('assets/images/biglogo.png');

    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.legal.copyWith(marginTop: 1.2 * PdfPageFormat.cm, marginLeft: 1.2 * PdfPageFormat.cm, marginRight: 1.2 * PdfPageFormat.cm, marginBottom: 1.2 * PdfPageFormat.cm),
        header: (context) => header(context, logo.buffer.asUint8List()),
        build: (pw.Context context) => [
          headerbody(context),
          pw.SizedBox(height: .6 * PdfPageFormat.cm),
          memberdata(context),
          pw.SizedBox(height: .6 * PdfPageFormat.cm),
          samplingtable(context),
          pw.SizedBox(height: .6 * PdfPageFormat.cm),
          testtable(context),
          pw.SizedBox(height: .6 * PdfPageFormat.cm),
          supportplate(context),
          pw.SizedBox(height: .6 * PdfPageFormat.cm),
          headertabletext(context, 'Pengendalian Mutu Lapangan'),
          pw.SizedBox(height: .6 * PdfPageFormat.cm),

        ]
      )
    );
    return pdf.save();
  }
  
  pw.Widget headerbodytext(pw.Context context, String text) {
    return pw.Text(
      text,
      style: pw.Theme.of(context).defaultTextStyle.copyWith(fontSize: 18)
    );
  }

  pw.Widget headerbodysubtext(pw.Context context, String text) {
    return pw.Text(
      text,
      style: pw.Theme.of(context).defaultTextStyle.copyWith(fontSize: 12)
    );
  }
  pw.Widget headertabletext(pw.Context context, String text) {
    return pw.Text(
      text,
      style: pw.Theme.of(context).defaultTextStyle.copyWith(fontSize: 14)
    );
  }

  pw.Widget header(pw.Context context, Uint8List logo) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          margin: const pw.EdgeInsets.only(bottom: .5 * PdfPageFormat.cm),
          decoration: const pw.BoxDecoration(
              border: pw.Border(
                  bottom: pw.BorderSide(width: 1, color: PdfColors.black))),
          child: pw.Container(
            height: 2 * PdfPageFormat.cm,
            child: pw.Image(pw.MemoryImage(logo))
          )
        ),
        
      ]
    );
  }

  pw.Widget headerbody(pw.Context context) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.center,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            headerbodytext(
              context,
              'Working Order Perencana Sampling',
            ),
            pw.SizedBox(height: 2 * PdfPageFormat.mm),
            headerbodysubtext(context, wo![0]['name']!)
          ]
        ),
        pw.SizedBox(width: 2 * PdfPageFormat.cm),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Container(
              height: 1.2 * PdfPageFormat.cm,
              width: 5 * PdfPageFormat.cm,
              child: pw.BarcodeWidget(
                data: wo![0]['name']!,
                barcode: pw.Barcode.code128()
              ),
            ),

          ]
        )
      ]
    );
  }

  pw.Widget tablecolumnheader(pw.Context context, String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(3 * PdfPageFormat.mm),
      child: pw.Text(text, style: pw.Theme.of(context).defaultTextStyle.copyWith(fontSize: 8, fontWeight: pw.FontWeight.bold)),
    );
  }

  pw.Widget tablecolumntext(pw.Context context, String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(3 * PdfPageFormat.mm),
      child: pw.Text(text, style: pw.Theme.of(context).defaultTextStyle.copyWith(fontSize: 8)),
    );
  }

  pw.Widget table(pw.Context context, {String? label, List<pw.TableRow>? children, Map<int, pw.TableColumnWidth>? widths}) {
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        headertabletext(context, label ?? ''),
        pw.SizedBox(height: 3 * PdfPageFormat.mm),
        pw.Table(
          border: const pw.TableBorder(
            left: pw.BorderSide(width: 1, color: PdfColors.grey),
            right: pw.BorderSide(width: 1, color: PdfColors.grey),
            top: pw.BorderSide(width: 1, color: PdfColors.grey),
            bottom: pw.BorderSide(width: 1, color: PdfColors.grey),
            horizontalInside: pw.BorderSide(width: 1, color: PdfColors.grey),
            verticalInside: pw.BorderSide(width: 1, color: PdfColors.grey)
          ),
          columnWidths: widths,
          children: children ?? []
        )
      ]
    ); 
  }

  pw.Widget membertable(pw.Context context) {
    return table(
      context,
      label: 'Anggota',
      children: member!.map((e){
        return pw.TableRow(
          children: [
            tablecolumnheader(context, e['title']!),
            tablecolumntext(context, e['name']!),
          ]
        );
      }).toList(),
      widths: {
        0: const pw.FixedColumnWidth(2.5 * PdfPageFormat.cm),
        1: const pw.FixedColumnWidth(3.5 * PdfPageFormat.cm)
      }
    );
  }

  pw.Widget datatable(pw.Context context) {
    return table(
      context,
      label: 'Data Work Order',
      children: wo!.map((e){
        return pw.TableRow(
          children: [
            tablecolumnheader(context, e['title']!),
            tablecolumntext(context, e['name']!),
          ]
        );
      }).toList(),
      widths: {
        0: const pw.FixedColumnWidth(5 * PdfPageFormat.cm),
        1: const pw.FixedColumnWidth(7.5 * PdfPageFormat.cm)
      }
    );
  }

  pw.Widget memberdata(pw.Context context) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        datatable(context),
        membertable(context)
      ]
    );
  }

  pw.Widget supporttable(pw.Context context) {
    List<pw.TableRow> t = [];
    var i = 0;
    support!.map((e) {
      if(i == 0) {
        t.add(pw.TableRow(
          children: [
            tablecolumnheader(context, e['check']!),
            tablecolumnheader(context, e['code']!),
            tablecolumnheader(context, e['param']!),
            tablecolumnheader(context, e['sign']!),
          ]
        ));

      } else {
        t.add(pw.TableRow(
          children: [
            tablecolumntext(context, e['check']!),
            tablecolumntext(context, e['code']!),
            tablecolumntext(context, e['param']!),
            tablecolumntext(context, e['sign']!),
          ]
        ));
      }
      i++;
    }).toList();

    return table(
      context,
      label: 'Parameter Pendukung',
      children: t,
      widths: {
        0: const pw.FixedColumnWidth(1.5 * PdfPageFormat.cm),
        1: const pw.FixedColumnWidth(3 * PdfPageFormat.cm),
        2: const pw.FixedColumnWidth(3 * PdfPageFormat.cm),
        3: const pw.FixedColumnWidth(2 * PdfPageFormat.cm)
      }
    );
  }

  pw.Widget platetable(pw.Context context) {
    List<pw.TableRow> t = [];
    var i = 0;
    plate!.map((e) {
      if(i == 0) {
        t.add(pw.TableRow(
          children: [
            tablecolumnheader(context, e['check']!),
            tablecolumnheader(context, e['plate']!),
            tablecolumnheader(context, e['volume']!),
            tablecolumnheader(context, e['label']!),
          ]
        ));

      } else {
        t.add(pw.TableRow(
          children: [
            tablecolumntext(context, e['check']!),
            tablecolumntext(context, e['plate']!),
            tablecolumntext(context, e['volume']!),
            tablecolumntext(context, e['label']!),
          ]
        ));
      }
      i++;
    }).toList();

    return table(
      context,
      label: 'Wadah Cadangan',
      children: t,
      widths: {
        0: const pw.FixedColumnWidth(1.6 * PdfPageFormat.cm),
        1: const pw.FixedColumnWidth(1.8 * PdfPageFormat.cm),
        2: const pw.FixedColumnWidth(2 * PdfPageFormat.cm),
        3: const pw.FixedColumnWidth(3.7 * PdfPageFormat.cm)
      }
    );
  }

  pw.Widget supportplate(pw.Context context) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        supporttable(context),
       platetable(context),
      ]
    );
  }

  pw.Widget samplingtable(pw.Context context) {
    List<pw.TableRow> t = [];
    var i = 0;
    sampling!.map((e) {
      if(i == 0) {
        t.add(pw.TableRow(
          children: [
            tablecolumnheader(context, e['code']!),
            tablecolumnheader(context, e['name']!),
            tablecolumnheader(context, e['location']!),
            tablecolumnheader(context, e['method']!),
            tablecolumnheader(context, e['field']!),
            tablecolumnheader(context, e['purpose']!),
            tablecolumnheader(context, e['rule']!),
            tablecolumnheader(context, e['quality']!),
          ]
        ));

      } else {
        t.add(pw.TableRow(
          children: [
            tablecolumntext(context, e['code']!),
            tablecolumntext(context, e['name']!),
            tablecolumntext(context, e['location']!),
            tablecolumntext(context, e['method']!),
            tablecolumntext(context, e['field']!),
            tablecolumntext(context, e['purpose']!),
            tablecolumntext(context, e['rule']!),
            tablecolumntext(context, e['quality']!),
          ]
        ));
      }
      i++;
    }).toList();

    return table(
      context,
      label: 'Data Sampling',
      children: t,
      widths: {
        0: const pw.FixedColumnWidth(.6 * PdfPageFormat.mm),
        1: const pw.FixedColumnWidth(.8 * PdfPageFormat.mm),
        2: const pw.FixedColumnWidth(.8 * PdfPageFormat.mm),
        3: const pw.FixedColumnWidth(1.2 * PdfPageFormat.mm),
        4: const pw.FixedColumnWidth(.8 * PdfPageFormat.mm),
        5: const pw.FixedColumnWidth(.8 * PdfPageFormat.mm),
        6: const pw.FixedColumnWidth(.8 * PdfPageFormat.mm),
        7: const pw.FixedColumnWidth(.8 * PdfPageFormat.mm)
      }
    );
  }


  pw.Widget testtable(pw.Context context) {
    List<pw.TableRow> t = [];
    var i = 0;
    test!.map((e) {
      if(i == 0) {
        t.add(pw.TableRow(
          children: [
            tablecolumnheader(context, e['check']!),
            tablecolumnheader(context, e['code']!),
            tablecolumnheader(context, e['test']!),
            tablecolumnheader(context, e['handle']!),
            tablecolumnheader(context, e['plate']!),
            tablecolumnheader(context, e['treatment']!),
            tablecolumnheader(context, e['volume']!),
            tablecolumnheader(context, e['limit']!),
            tablecolumnheader(context, e['method']!),
          ]
        ));

      } else {
        t.add(pw.TableRow(
          children: [
            tablecolumntext(context, e['check']!),
            tablecolumntext(context, e['code']!),
            tablecolumntext(context, e['test']!),
            tablecolumntext(context, e['handle']!),
            tablecolumntext(context, e['plate']!),
            tablecolumntext(context, e['treatment']!),
            tablecolumntext(context, e['volume']!),
            tablecolumntext(context, e['limit']!),
            tablecolumntext(context, e['method']!),
          ]
        ));
      }
      i++;
    }).toList();

    return table(
      context,
      label: 'Parameter Pengujian',
      children: t,
      widths: {
        0: const pw.FixedColumnWidth(.6 * PdfPageFormat.mm),
        1: const pw.FixedColumnWidth(.8 * PdfPageFormat.mm),
        2: const pw.FixedColumnWidth(.9 * PdfPageFormat.mm),
        3: const pw.FixedColumnWidth(1 * PdfPageFormat.mm),
        4: const pw.FixedColumnWidth(.7 * PdfPageFormat.mm),
        5: const pw.FixedColumnWidth(1 * PdfPageFormat.mm),
        6: const pw.FixedColumnWidth(.7 * PdfPageFormat.mm),
        7: const pw.FixedColumnWidth(1 * PdfPageFormat.mm),
        8: const pw.FixedColumnWidth(1 * PdfPageFormat.mm)
      }
    );
  }

}
