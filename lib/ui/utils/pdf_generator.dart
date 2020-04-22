import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PdfPreviewScreen extends StatelessWidget {
  final String path;

  PdfPreviewScreen({this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
    );
  }
}

class MyPdfHomePage extends StatefulWidget {
  @override
  _MyPdfHomePageState createState() => _MyPdfHomePageState();
}

class _MyPdfHomePageState extends State<MyPdfHomePage> {
  final _formkey = GlobalKey<FormState>();
  
   



    Future<PdfImage> pdfImageFromImage(
    {@required PdfDocument pdf, @required ui.Image image}) async {
    final ByteData bytes =
      await image.toByteData(format: ui.ImageByteFormat.rawRgba);

  return PdfImage(pdf,
      image: bytes.buffer.asUint8List(),
      width: image.width,
      height: image.height);
}

  Future<PdfImage> pdfImageFromImageProvider(
    {@required PdfDocument pdf,
    @required ImageProvider image,
    ImageConfiguration configuration,
    ImageErrorListener onError}) async {
  final Completer<PdfImage> completer = Completer<PdfImage>();
  final ImageStream stream =
      image.resolve(configuration ?? ImageConfiguration.empty);

  ImageStreamListener listener;
  listener = ImageStreamListener((ImageInfo image, bool sync) async {
    final PdfImage result =
        await pdfImageFromImage(pdf: pdf, image: image.image);
    if (!completer.isCompleted) {
      completer.complete(result);
    }
    stream.removeListener(listener);
  }, onError: (dynamic exception, StackTrace stackTrace) {
    if (!completer.isCompleted) {
      completer.complete(null);
    }
    if (onError != null) {
      onError(exception, stackTrace);
      print('this is the error youre looking for.');
    } else {
      // https://groups.google.com/forum/#!topic/flutter-announce/hp1RNIgej38
      assert(false, 'image failed to load');
    }
  });

  stream.addListener(listener);
  return completer.future;
}

  final pdf = pw.Document();

  writeOnPdf() async {

    const imageProvider = const AssetImage('assets/images/Results-skeleton-logo.png');
     
    final PdfImage image = await pdfImageFromImageProvider(
    pdf: pdf.document, 
    image: imageProvider
    );



  
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: pw.EdgeInsets.all(32),

        build: (pw.Context context){
          return <pw.Widget>  [
            pw.Header(
              level: 0,
              child: pw.Text("This is the first test to generating ResultsPro PDFs for futher use")
            ),

            pw.Paragraph(
              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
            ),

            pw.Paragraph(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
            ),

            pw.Header(
              level: 1,
              child: pw.Text("Second Heading")
            ),

            pw.Paragraph(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
            ),

            pw.Paragraph(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
            ),

            pw.Paragraph(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
            ),
            pw.Image(image),
             
          ];
        },
      )
    );
  }

  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Test"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Form(         
          key: _formkey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("PDF TUTORIAL", style: TextStyle(fontSize: 34),),
             SizedBox(height:20.0),          
          ],
        ),
      ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          writeOnPdf();
          await savePdf();

          Directory documentDirectory = await getApplicationDocumentsDirectory();

          String documentPath = documentDirectory.path;

          String fullPath = "$documentPath/example.pdf";

          Navigator.push(context, MaterialPageRoute(
            builder: (context) => PdfPreviewScreen(path: fullPath,)
          ));

        },
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}