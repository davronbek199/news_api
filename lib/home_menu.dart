import 'package:flutter/material.dart';
import 'package:news_api/api_response.dart';
import 'package:news_api/main_provider.dart';
import 'package:provider/provider.dart';

import 'news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainProvider? _mainP;

  @override
  void initState() {
    super.initState();

    _mainP = Provider.of<MainProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("NEWS"),
      ),
      body: FutureBuilder(
        future: _mainP?.fetchNews(),
        builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
          if (snapshot.data?.status == Status.LOADING) {
            return CircularProgressIndicator();
          }
          if (snapshot.data?.status == Status.ERROR) {
            return Center(
              child: Text(snapshot.data!.message!),
            );
          }
          if (snapshot.data?.status == Status.SUCCESS) {
            return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 4) print("AAA ${snapshot.data?.data[index]}");
                  return Column(
                    children: [
                      NewsCard(
                        article: snapshot.data!.data[index],
                      ),
                      const Divider(thickness: 1.0),
                    ],
                  );
                });
          }
          return Container();
        },
      ));

  }
}
