import 'package:flutter/material.dart';
import 'package:wakke_fun/models/feed-item.dart';

class FeedItemContainer extends StatelessWidget {
  final FeedItem feedItem;
  const FeedItemContainer(
    this.feedItem, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 10),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: feedItem.usuario_autor_imagem_perfil == null
                            ? AssetImage('images/icon_account.png')
                                as ImageProvider
                            : NetworkImage(
                                feedItem.usuario_autor_imagem_perfil!)),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(feedItem.usuario_autor_apelido,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                ImageIcon(AssetImage('images/icon_coments.png'), color: Colors.red.shade700,),
                SizedBox(
                  width: 5,
                ),
                Text(feedItem.comentarios_qtd.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red.shade700,)),
                SizedBox(
                  width: 20,
                ),
                ImageIcon(AssetImage('images/icon_star.png'), color: Colors.red.shade700,),
                SizedBox(
                  width: 5,
                ),
                Text(feedItem.media_nota.toStringAsFixed(2),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red.shade700,)),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Image(
              height: 300,
              image: NetworkImage(feedItem.imagem_capa),
            ),
            Positioned(
              bottom: 40,
              child: Container(
                padding: EdgeInsets.all(5),
                height: 75,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.tealAccent.shade700.withOpacity(0.95),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    feedItem.titulo,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),

          ],
        )
      ]),
    );
  }
}
