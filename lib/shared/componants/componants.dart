import 'package:flutter/material.dart';import 'package:news_app/moduels/web_view/web_view_screen.dart';Widget newsCard(articles, context) => InkWell(    onTap: () {      Navigator.push(        context,        MaterialPageRoute(          builder: (context) => WebViewScreen(            url: articles['url'],          ),        ),      );    },    child: Padding(      padding: const EdgeInsets.all(15.0),      child: Row(        children: [          Container(            height: 120,            width: 120,            decoration: BoxDecoration(              borderRadius: BorderRadius.circular(                20.0,              ),              image: DecorationImage(                fit: BoxFit.cover,                image: NetworkImage(                  '${articles['urlToImage']}',                ),              ),            ),          ),          SizedBox(            width: 10.0,          ),          Expanded(            child: Container(              height: 120,              child: Column(                mainAxisAlignment: MainAxisAlignment.start,                crossAxisAlignment: CrossAxisAlignment.start,                children: [                  Expanded(                    child: Text(                      '${articles['title']}',                      style: Theme.of(context).textTheme.bodyText1,                      maxLines: 4,                      overflow: TextOverflow.ellipsis,                    ),                  ),                  Text(                    '${articles['publishedAt']}',                    style: TextStyle(                      color: Colors.grey,                    ),                  ),                ],              ),            ),          ),        ],      ),    ));Widget newsScreen(list) => list.length > 0    ? ListView.separated(        physics: BouncingScrollPhysics(),        separatorBuilder: (context, index) => Padding(          padding: const EdgeInsetsDirectional.only(            start: 15.0,          ),          child: Container(            height: 1,            color: Colors.grey[300],          ),        ),        itemBuilder: (context, index) => newsCard(list[index], context),        itemCount: list.length,      )    : Center(child: CircularProgressIndicator());