import 'package:flutter/material.dart';
import 'package:wakke_fun/helpers/json-helper.dart';

import '../models/profile.dart';
import '../widget/comment-container.dart';
import '../widget/sub-header-item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: FutureBuilder<Profile>(
          future: JsonHelper.getFirstProfile(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Column(
                children: [
                  buildHeader(snapshot.data!),
                  SizedBox(
                    height: 30,
                  ),
                  buildSubHeader(),
                  SizedBox(
                    height: 15,
                  ),
                  buildChallengeTittle(),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, i){
            return CommentContainer(profile: snapshot.data!);
            }),
                ],
              );
            }else{
              return Container();
            }

          }
        ),
      ),
    );
  }

  Row buildChallengeTittle() {
    return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage('images/icon_flame.png'),
                      color: Colors.deepPurple),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Desafios',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 18),
                  )
                ],
              );
  }

  Row buildSubHeader() {
    return Row(
                children: [
                  Expanded(
                    child: SubHeaderItem('42', 'desafios', 'images/icon_badge.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SubHeaderItem('1.3k', 'seguidores', 'images/icon_love.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SubHeaderItem('123', 'seguindo', 'images/icon_seguindo.png'),
                  ),
                ],
              );
  }

  Row buildHeader(Profile profile) {
    return Row(
                children: [
                      Container(
                        height: 140,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.deepPurple.shade800, width: 2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      image: DecorationImage(
                                          fit: BoxFit.fill, image: NetworkImage(profile.fotoPath))),
                                ),
                              ),
                            ),
                            Image.asset('images/coroa.png')
                          ],
                        ),
                      ),
                  SizedBox(width: 20),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(height: 20,),
                    Text(
                      'Olá, ${profile.nome}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(profile.apelido,
                        style: TextStyle(color: Colors.grey.shade600)),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('editar'),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          primary: Colors.tealAccent.shade700,
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          textStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    ),
                  ]),
                ],
              );
  }
}


