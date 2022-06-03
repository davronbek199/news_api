import 'package:flutter/material.dart';
import 'package:news_api/models/news_response.dart';
import 'package:webview_flutter/webview_flutter.dart';


class DetailsPage extends StatefulWidget {

  final Articles article;

  const DetailsPage({Key? key, required this.article, }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),  
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: widget.article.url??"",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    );
  }
}
