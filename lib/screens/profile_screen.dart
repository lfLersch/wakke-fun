import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String perfilImage =
      'https://firebasestorage.googleapis.com/v0/b/wakke-fun.appspot.com/o/users%2Fa6ef1eca-7e78-420b-b46a-fc8595fcb7f4?alt=media&token=6642fe6d-1cea-48d6-b8d7-cfc122e4ebc8';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Stack(children: []),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                height: 120,
                width: 120,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(perfilImage))),
                ),
                decoration: BoxDecoration(
                  border:
                  Border.all(color: Colors.deepPurple.shade800, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Olá, José Silva',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text('jose_silva_2020',
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
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('42',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                          Spacer(),
                          Image.asset('images/icon_badge.png')
                        ],
                      ),
                      Text('desafios',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15)),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('42',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                          Spacer(),
                          Image.asset('images/icon_badge.png')
                        ],
                      ),
                      Text('desafios',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15)),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('42',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                          Spacer(),
                          Image.asset('images/icon_badge.png')
                        ],
                      ),
                      Text('desafios',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15)),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
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
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              )],
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            height: 120,
            width: double.maxFinite,
            child: Column(children: [
              Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(perfilImage))),
                      ),
                      SizedBox(width: 10,),
                      Text('José Silva', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey.shade800, fontSize: 13),),
                      Spacer(),
                      Text('21/12/2020', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 13),)
                    ],
                  )),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Você conhece as regras de acentuação das paroxítonas? teste seus conhecimentos...',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                    ),
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
