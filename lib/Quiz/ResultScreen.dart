import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isro_quiz/Quiz/save_file_mobile.dart' ;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:intl/intl.dart';

class ResulttScreen extends StatefulWidget {
 // const ResulttScreen({Key key}) : super(key: key);

int points;
ResulttScreen(this.points);

  @override
  State<ResulttScreen> createState() => _ResulttScreenState();
}

class _ResulttScreenState extends State<ResulttScreen> {

  var points,msg;

  Future<void> generateInvoice() async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    //Draw rectangle
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
        pen: PdfPen(PdfColor(142, 170, 219)));
    //Generate PDF grid.
    //final PdfGrid grid = getGrid();
    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(page, pageSize);
    //Draw grid
    // drawGrid(page, grid, result);
    //Add invoice footer
    //  drawFooter(page, pageSize);
    //Save the PDF document
    final List<int> bytes = document.saveSync();
    //Dispose the document.
    document.dispose();
    //Save and launch the file.
    await saveAndLaunchFile(bytes, 'ISRO Result.pdf');
  }

  //Draws the invoice header
  PdfLayoutResult drawHeader(PdfPage page, Size pageSize) {
    //Draw rectangle
    page.graphics.drawRectangle(
        brush: PdfSolidBrush(PdfColor(91, 126, 215)),
        bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 90));
    //Draw string
    page.graphics.drawString(
        'ISRO Quiz Result', PdfStandardFont(PdfFontFamily.helvetica, 30),
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
        brush: PdfSolidBrush(PdfColor(65, 104, 205)));

    page.graphics.drawString( '${widget.points.toString()}',
        // page.graphics.drawString(r'$' + getTotalAmount(grid).toString(),
        PdfStandardFont(PdfFontFamily.helvetica, 18),
        bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 100),
        brush: PdfBrushes.white,
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));

    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //Draw string
    page.graphics.drawString('Points', contentFont,
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 33),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.bottom));

    final Size contentSize = contentFont.measureString('ddsfs');

    if(widget.points>35){
       msg = '''Congrats!: \r\n\r\n You have passed test!''';
    } else {
        msg = '''Woops!: \r\n\r\n You have failed test!''';
    }

    return PdfTextElement(text: msg, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(30, 120,
            pageSize.width - (contentSize.width + 30), pageSize.height - 120));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/result.svg',height: 300,width: 300,),
                  ],
                ),
                SizedBox(height: 30,),
                ShowResult(),
                SizedBox(height: 40,),
                GestureDetector(
                    onTap: (){
                      generateInvoice();
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration:  BoxDecoration(
                        // color: Colors.lightBlueAccent,
                          border: Border.all(
                              color:  Color(0xFF3c61fa)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            Text('Download Result',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF3c61fa),
                              fontWeight: FontWeight.w800,
                            ),)
                          ],
                        ),
                      ),
                    )
                ),
              ],
            ),
          )
        ));
  }

    Widget ShowResult(){
    if(widget.points>5){
      print('passed');
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Congrats! \n',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF3c61fa),
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: 'You have passed test! ',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF31343c),
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      );
    }else{
      print('failed');
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Woops! \n',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF3c61fa),
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: 'You have failed test :/ ',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF31343c),
                fontWeight: FontWeight.w800,
              ),
            ),


          ],
        ),
      );
    }
    }
}
