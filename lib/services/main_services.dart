// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:barcode/barcode.dart';
// import 'package:htmltopdfwidgets/htmltopdfwidgets.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:flutter/services.dart';
import 'package:print_as_html/models/products_model.dart';

// printOrders({List<Product>? products, String? employeeName}) async {
//   String createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
//   final logoByteData = await rootBundle.load('assets/images/logo.png');
//   final logoBase64 = base64Encode(Uint8List.view(logoByteData.buffer));
//   String items = '''
//   <style>
//     @font-face {
//     font-family: 'Cairo';
//     src: url('assets/fonts/Cairo-Regular.ttf');
//   }
//   body {
//     font-family: 'Cairo', sans-serif;
//   }
//     table {
//       border-collapse: collapse;
//       width: 100%;
//     }
//     th, td {
//       border: 1px solid #ddd;
//       padding: 8px;
//       text-align: right;
//     }
//     th {
//       background-color: #f2f2f2;
//     }
//   </style>

//   <html dir="rtl">

//   <div style="display: flex; align-items: center; justify-content: space-between;">
//   <h1 class="header">فاتورة المنتجات</h1>
//   <img src="data:image/png;base64, $logoBase64" alt="Company Logo" style="max-width:70px; max-height: 70px;"> <!-- Adjust the image URL and size as needed -->
//   </div>

//   <h3>تاريخ الفاتورة: $createdAt</h2>
//   <h2 class="header">اسم الموظف: $employeeName</h2>

//   <h2 class="header">التفاصيل:</h2>

//   <table>
//     <thead>
//       <tr>
//        <th>رقم المنتج</th>
//        <th>اسم المنتج</th>
//        <th>السعر</th>
//        <th>السعر بعد الخصم</th>
//        <th>عدد القطع</th>
//        <th>ملحوظة</th>
//        <th>التاريخ</th>
//        <th>الاجمالي</th>
//       </tr>
//     </thead>
//     <tbody>
//   ''';
//   double totalPrice = 0.0;
//   for (var product in products!) {
//     double total = product.priceAfterDiscount! * product.quantity!;
//     totalPrice += total;
//     items += '<tr>';
//     items += '<td>${product.id}</td>';
//     items += '<td>${product.name}</td>';
//     items += '<td>${product.price} EG</td>';
//     items += '<td>${product.priceAfterDiscount} EG</td>';
//     items += '<td>${product.quantity} </td>';
//     items += '<td>${product.note}</td>';
//     items += '<td>${product.createdAt}</td>';
//     items += '<td>$total EG</td>';
//     items += '</tr>';
//   }

//   items += '</table>';
//   items += '<h3>الاجمالى : $totalPrice EG </h3>';
//   final widgets = await HTMLToPdf().convert(
//     items,
//     defaultFontFamily: "Cairo",
//   );
//   final pdf = pw.Document();
//   pdf.addPage(pw.MultiPage(build: (context) => widgets));

//   // await Printing.layoutPdf(
//   //   format: PdfPageFormat.roll80,
//   //   onLayout: (format) async => // return await pdf.save();
//   //       await Printing.convertHtml(
//   //     format: PdfPageFormat.a4,
//   //     html: items,
//   //   ),
//   // );
// }

// Future<void> printPdfConver() async {
//   await Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
//     const body = '''
//     <h1>Heading Example</h1>
//     <p>This is a paragraph.</p>
//     <img src="image.jpg" alt="Example Image" />
//     <blockquote>This is a quote.</blockquote>
//     <ul>
//       <li>على </li>
//       <li>Second item</li>
//       <li>Third item</li>
//     </ul>
//     ''';

//     final pdf = pw.Document();
//     final widgets = await HTMLToPdf().convert(body);
//     pdf.addPage(pw.MultiPage(build: (context) => widgets));
//     return await pdf.save();
//   });
// }

// Future<Uint8List> testArabic(List<Product>? products) async {
//   final font = await PdfGoogleFonts.cairoRegular();
//   final pdf = pw.Document();
//   pdf.addPage(
//     pw.MultiPage(
//       theme: pw.ThemeData.withFont(base: font),
//       build: (context) => [
//         pw.Text('فاتورة المنتجات',
//             style: pw.TextStyle(font: font, fontSize: 18)),
//         pw.Table.fromTextArray(data: [
//           ['رقم المنتج', 'اسم المنتج', 'السعر', 'الاجمالي'],
//           ...products!.map((product) => [
//                 product.id,
//                 product.name,
//                 '${product.price} EG',
//                 '${product.priceAfterDiscount} EG'
//               ])
//         ])
//       ],
//     ),
//   );
//   return await pdf.save();
// }

Future<void> printArabicInvoice() async {
  final font = await PdfGoogleFonts.cairoRegular();
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      // textDirection: pw.TextDirection.rtl,
      // pageFormat: PdfPageFormat.roll80,
      // pageTheme: pw.ThemeData()/,
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          // pw.Image(pw.MemoryImage(imageBytes)),
          pw.Text(
            // 'خواتم 18 ل ساده',
            "اسم الدكتور : محمد احمد السيد",
            style: pw.TextStyle(font: font, fontSize: 10),
            textDirection: pw.TextDirection.rtl,
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            // 'الوزن 3.88',
            "اسم المريض : محمد احمد السيد",
            style: pw.TextStyle(font: font, fontSize: 10),
            textDirection: pw.TextDirection.rtl,
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            'سن المريض : 20',
            style: pw.TextStyle(font: font, fontSize: 10),
            textDirection: pw.TextDirection.rtl,
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            "رقم الهاتف: 01270666236",
            style: pw.TextStyle(font: font, fontSize: 10),
            textDirection: pw.TextDirection.rtl,
          ),
          pw.SizedBox(height: 50),
          pw.Text(
            "فاتورة المنتجات",
            style: pw.TextStyle(font: font, fontSize: 10),
            textDirection: pw.TextDirection.rtl,
          ),
          // pw.Table(
          //   border: pw.TableBorder.all(),
          //   children: [
          //     pw.TableRow(
          //       children: [
          //         pw.Padding(
          //           padding: pw.EdgeInsets.all(8.0),
          //           child: pw.Text('رقم المنتج',
          //               style: pw.TextStyle(font: font),
          //               textDirection: pw.TextDirection.rtl),
          //         ),
          //         pw.Padding(
          //           padding: pw.EdgeInsets.all(8.0),
          //           child: pw.Text('اسم المنتج',
          //               style: pw.TextStyle(font: font),
          //               textDirection: pw.TextDirection.rtl),
          //         ),
          //         pw.Padding(
          //           padding: pw.EdgeInsets.all(8.0),
          //           child: pw.Text('السعر',
          //               style: pw.TextStyle(font: font),
          //               textDirection: pw.TextDirection.rtl),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    ),
  );

  await Printing.layoutPdf(
    format: PdfPageFormat.roll80,
    onLayout: (PdfPageFormat format) async => await pdf.save(),
  );
}

Future<File> generateBarcode(String code) async {
  final barcode = Barcode.code128();
  final svg = barcode.toSvg(code, width: 300, height: 80);

  final directory = await getTemporaryDirectory();
  final file = File('${directory.path}/barcode.svg');
  await file.writeAsString(svg);
  return file;
}
