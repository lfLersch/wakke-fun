import 'package:wakke_fun/models/usuario-autor-borda.dart';
import 'package:wakke_fun/models/usuario-autor-icone.dart';

class FeedItem{
  late String id;
  late String desafio_id;

  late bool privado;
  late bool status_ativo;
  late bool finalizado;
  late bool pode_ser_excluido;
  late int partidas_executadas_qtd;
  late int comentarios_qtd;
  late double media_acertos;
  late double media_duracao;
  late double media_nota;
  late double porcetagem_media_acertos;
  late double avaliacao_nota;
  late String titulo;
  late String descricao;
  late String usuario_autor;
  late String usuario_autor_nome;
  late String usuario_autor_apelido;
  late String imagem_capa;
  late String link_video;
  late String numero_nic;
  late String data_criacao;
  late int v;
  String? usuario_autor_imagem_perfil;
  UsuarioAutorBorda? usuarioAutorBorda;
  UsuarioAutorIcone? usuarioAutorIcone;

  FeedItem(
      this.id,
      this.desafio_id,
      this.privado,
      this.status_ativo,
      this.finalizado,
      this.pode_ser_excluido,
      this.partidas_executadas_qtd,
      this.comentarios_qtd,
      this.media_acertos,
      this.media_duracao,
      this.media_nota,
      this.porcetagem_media_acertos,
      this.avaliacao_nota,
      this.titulo,
      this.descricao,
      this.usuario_autor,
      this.usuario_autor_nome,
      this.usuario_autor_apelido,
      this.imagem_capa,
      this.link_video,
      this.numero_nic,
      this.data_criacao,
      this.v,
      this.usuario_autor_imagem_perfil,
      this.usuarioAutorBorda,
      this.usuarioAutorIcone);
}