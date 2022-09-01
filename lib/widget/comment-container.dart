import 'package:flutter/material.dart';

import '../models/profile.dart';

class CommentContainer extends StatelessWidget {
  final Profile profile;
  const CommentContainer({
    Key? key, required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
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
                          image: NetworkImage(profile.fotoPath))),
                ),
                SizedBox(width: 10,),
                Text(profile.nome, style: TextStyle(
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
    );
  }
}
