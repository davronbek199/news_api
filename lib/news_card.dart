import 'package:flutter/material.dart';
import 'package:news_api/models/news_response.dart';

import 'details_page.dart';

class NewsCard extends StatelessWidget {
  final Articles article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14),
          height: 120,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 90,
                child: Image.network(article.urlToImage ?? ""),
              ),
              SizedBox(
                width: 12,
              ),
              Flexible(
                  child: InkWell(
                      onTap: () {
                        
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage(article: article,),
                        ));
                      },
                      child: Text(
                        article.title??"",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )))
            ],
          ),
        ),
        Divider(
          height: 0,
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
