import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget{
  String url;
  String title;

  WebViewPage(this.url, this.title);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () async {
                  _controller.goBack();
                },
                icon: Icon(Icons.arrow_back)
            ),
            IconButton(
                onPressed: () async {
                  _controller.goForward();
                },
                icon: Icon(Icons.arrow_forward)
            ),
            IconButton(
                onPressed: () async {
                  _controller.reload();
                },
                icon: Icon(Icons.refresh)
            )
          ],
        ),
        body: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (value){
                if(value == 100){
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              initialUrl: widget.url,
            ),
            isLoading ? Center(child: CircularProgressIndicator(),) : Stack()
          ],
        )
      );
  }
}