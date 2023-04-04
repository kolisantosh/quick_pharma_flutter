import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/util/ColorConstants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebViewClass extends StatefulWidget {
  final String title;
  final String url;

  WebViewClass(this.title, this.url);

  @override
  _WebViewClassState createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    print(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView(
                children: [
                  // WebView(
                  //   initialUrl: widget.url,
                  //   onWebViewCreated: (WebViewController webViewController) {
                  //     _controller.complete(webViewController);
                  //   },
                  //   onPageFinished: (finish) {
                  //     print(finish.toString());
                  //     setState(() {
                  //       isLoading = false;
                  //     });
                  //   },
                  //   onPageStarted: (url) {
                  //     print(url.toString());
                  //     setState(() {
                  //       isLoading = false;
                  //     });
                  //   },
                  // ),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container()
                ],
              ),
            ))

          ],
        ),
      ),
    );
  }
}
