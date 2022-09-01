import 'package:flutter/material.dart';
import 'package:wakke_fun/principal_manager.dart';

import '../helpers/json-helper.dart';
import '../widget/feed-item-container.dart';

class FeedScreen extends StatefulWidget {
  static const String id = 'feed_screen';
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with AutomaticKeepAliveClientMixin<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 20,
              child: Row(children: [
                Image.asset('images/icon_chat.png'),
                SizedBox(width: 5,),
                Text('Está Acontecendo...', style: TextStyle(color: Colors.deepPurple, fontSize: 20),)
              ]),
            ),
            FutureBuilder(
                future: JsonHelper.getItems(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i){
                          return FeedItemContainer(snapshot.data![i]);
                        });
                  } else {
                    return Container();
                  }
                }),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
