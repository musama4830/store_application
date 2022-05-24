import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../widgets/mobile_pdf.dart'
    if (dart.library.html) '../widgets/web_pdf.dart';

class QrcodeScreen extends StatelessWidget {
  static const routeName = '/qr_code_screen';

  Future<void> createPDF(List<Product> products) async {
    int topHieght = 0;
    PdfDocument document = PdfDocument();
    var page = document.pages.add();

    page.graphics.drawString(
        'Products QR_Code', PdfStandardFont(PdfFontFamily.helvetica, 20));

    for (int i = 0; i <= products.length/4; i++) {
      if (4 * i < products.length) {
        page.graphics.drawImage(PdfBitmap(products[4 * i].image),
            Rect.fromLTWH(30, 60 + (120 * topHieght).toDouble(), 85, 90));
      }
      if (4 * i + 1 < products.length) {
        page.graphics.drawImage(PdfBitmap(products[4 * i + 1].image),
            Rect.fromLTWH(155, 60 + (120 * topHieght).toDouble(), 85, 90));
      }
      if (4 * i + 2 < products.length) {
        page.graphics.drawImage(PdfBitmap(products[4 * i + 2].image),
            Rect.fromLTWH(280, 60 + (120 * topHieght).toDouble(), 85, 90));
      }
      if (4 * i + 3 < products.length) {
        page.graphics.drawImage(PdfBitmap(products[4 * i + 3].image),
            Rect.fromLTWH(405, 60 + (120 * topHieght).toDouble(), 85, 90));
      }
      topHieght++;
      if (i > 0 && i%5 == 0) {
        topHieght = 0;
        page = document.pages.add();
        page.graphics.drawString(
            'Products QR_Code', PdfStandardFont(PdfFontFamily.helvetica, 20));
      }
    }

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Products QR_Code.pdf');
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products QR_Code'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => createPDF(productsData.items),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 1.6,
              crossAxisCount: 2,
            ),
            itemCount: productsData.items.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width - 5,
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                margin:
                    const EdgeInsets.only(left: 3, bottom: 3, top: 3, right: 3),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Image.memory(productsData.items[index].image),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
