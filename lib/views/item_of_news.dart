import 'package:examgetxbloc/models/news_model.dart';
import 'package:flutter/material.dart';

Widget itemOfNews(CoinNews coinNews){
  return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coinNews.articles.first.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(coinNews.articles.first.description,
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            Divider(),
          ],
      )
  );
}