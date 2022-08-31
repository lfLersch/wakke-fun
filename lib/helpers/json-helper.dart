import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:wakke_fun/helpers/color-helper.dart';
import 'package:wakke_fun/models/usuario-autor-borda.dart';
import 'package:wakke_fun/models/usuario-autor-icone.dart';

import '../models/feed-item.dart';

class JsonHelper{
  static Future<List<FeedItem>> getItems() async {
    List<FeedItem> items = [];
    final String response = await rootBundle.loadString('files/json_wakkefun.json');
    final data = await json.decode(response);
    for(var item in data){
      UsuarioAutorBorda? usuarioAutorBorda = item['usuario_autor_borda'] == null ? null : UsuarioAutorBorda(item['usuario_autor_borda']['id'], HexColor(item['usuario_autor_borda']['color1']), HexColor(item['usuario_autor_borda']['color2']));
      UsuarioAutorIcone? usuarioAutorIcone = item['usuario_autor_icone'] == null ? null : UsuarioAutorIcone(item['usuario_autor_icone']['id'], item['usuario_autor_icone']['url'], item['usuario_autor_icone']['xp_amount']);
      items.add(FeedItem(item['_id'], item['desafio_id'], item['privado'], item['status_ativo'], item['finalizado'], item['pode_ser_excluido'], item['partidas_executadas_qtd'], item['comentarios_qtd'], item['media_acertos'].toDouble(), item['media_duracao'].toDouble(), item['media_nota'].toDouble(), item['porcetagem_media_acertos'].toDouble(), item['avaliacao_nota'].toDouble(), item['titulo'], item['descricao'], item['usuario_autor'], item['usuario_autor_nome'], item['usuario_autor_apelido'], item['imagem_capa'], item['link_video'], item['numero_nic'], item['data_criacao'], item['__v'], item['usuario_autor_imagem_perfil'], usuarioAutorBorda, usuarioAutorIcone));
    }
    return items;
  }
}