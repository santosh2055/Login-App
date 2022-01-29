// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_app/Provider/news.dart';
import 'package:login_app/Utils/lodingIndicator.dart';
import 'package:login_app/Widget/bottomNavbar.dart';
import 'package:login_app/Widget/newsScreenAppbar.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<News>(context).getNews();
    final newsData = Provider.of<News>(context, listen: false);
    final readyNews = newsData.news;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 10,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: NewsScreenAppBar(),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/HomeScreen');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: readyNews.isEmpty
            ? Loading()
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: readyNews.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imgUrl: readyNews[index].urlToImage ?? "",
                              title: readyNews[index].title ?? "",
                              desc: readyNews[index].description ?? "",
                              content: readyNews[index].content ?? "",
                              posturl: readyNews[index].articleUrl ?? "",
                            );
                          }),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String? imgUrl, title, desc, content, posturl;

  NewsTile({
    this.imgUrl,
    this.desc,
    this.title,
    this.content,
    @required this.posturl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: posturl!,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    imgUrl!,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  title!,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  desc!,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArticleView extends StatefulWidget {
  final String postUrl;
  ArticleView({required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/NewsScreen');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: NewsScreenAppBar(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.postUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
