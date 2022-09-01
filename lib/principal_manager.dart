import 'package:flutter/material.dart';
import 'package:wakke_fun/helpers/index.dart';
import 'package:wakke_fun/helpers/json-helper.dart';
import 'package:wakke_fun/screens/feed-screen.dart';
import 'package:wakke_fun/screens/game-screen.dart';
import 'package:wakke_fun/screens/notification-screen.dart';
import 'package:wakke_fun/screens/profile_screen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PrincipalManager extends StatefulWidget {
  static const String id = 'principal_manager';
  const PrincipalManager({Key? key}) : super(key: key);

  @override
  State<PrincipalManager> createState() => _PrincipalManagerState();
}

class _PrincipalManagerState extends State<PrincipalManager>
    with SingleTickerProviderStateMixin {
  final Index _index = Index();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isSearching = false;
  late FocusNode _focusNode;
  late PageController pageController;
  late String fotoPath;

  @override
  void initState() {
    _index.value = 0;
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade200,
      appBar: buildAppBar(),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple.withOpacity(0.9),
        child: Column(children: [
          SizedBox(height: 60,),
          Image.asset('images/logo_wakke_branco.png', height: 25,),
          SizedBox(
            height: 30,
          ),
          FutureBuilder<String>(
              future: JsonHelper.getfotoPath(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(child: FittedBox(child: Image.network(snapshot.data!, height: 100, width: 100, fit: BoxFit.fill,)));
                } else {
                  return Container(
                    height: 300,
                    width: 300,
                  );
                }
              }),
          ListTile(
            title: Text('Feed Fun', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            title: Text('Times', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Notificações', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Conexões', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Minha Conta', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Plano', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Ajuda', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Spacer(),
          ListTile(
            title: Text('Sair', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Text('Termos de Uso e Política de Privacidade', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,)),
          SizedBox(height: 40),
        ]),
      ),
      body: buildPageView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isSearching ? null : buildFloatingActionButton(),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: Observer(
        builder: (_) => Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: ImageIcon(
                const AssetImage('images/icon_header_menu.png'),
                color: _index.value == 0 ? Colors.deepPurple : Colors.black87,
              ),
              onPressed: () {
                if (_index.value != 0) {
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                }
              },
            ),
            IconButton(
              icon: ImageIcon(
                const AssetImage('images/icon_add.png'),
                color: _index.value == 1 ? Colors.deepPurple : Colors.black87,
              ),
              onPressed: () {
                if (_index.value != 1) {
                  pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                }
              },
            ),
            const SizedBox(),
            IconButton(
              icon: ImageIcon(
                const AssetImage('images/icon_account.png'),
                color: _index.value == 2 ? Colors.deepPurple : Colors.black87,
              ),
              onPressed: () {
                if (_index.value != 2) {
                  pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                }
              },
            ),
            IconButton(
              icon: ImageIcon(
                const AssetImage(
                  'images/icon_notificacoes.png',
                ),
                color: _index.value == 3 ? Colors.deepPurple : Colors.black87,
              ),
              onPressed: () {
                if (_index.value != 3) {
                  pageController.animateToPage(3,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showToast();
      },
      backgroundColor: null,
      child: const Align(
          alignment: Alignment.center,
          child: Image(image: AssetImage('images/button_fun.png'), height: 60)),
    );
  }

  PageView buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        _index.setValue(pageController.page!.round());
      },
      children: [
        FeedScreen(),
        GameScreen(),
        ProfileScreen(),
        NotificationScreen(),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        title: isSearching
            ? TextFormField(focusNode: _focusNode)
            : const Image(
                image: AssetImage('images/logo_wakke_roxo.png'),
                height: 20,
              ),
        centerTitle: true,
        leading: IconButton(
          icon: const ImageIcon(AssetImage('images/icon_header_menu.png'),
              color: Colors.deepPurple),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: isSearching
                ? const ImageIcon(
                    AssetImage('images/icon_input_delete_branco.png'),
                    color: Colors.deepPurple)
                : const ImageIcon(AssetImage('images/icon_header_search.png'),
                    color: Colors.deepPurple),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                _focusNode.requestFocus();
              });
            },
          )
        ]);
  }

  showToast() {
    Fluttertoast.showToast(
        msg: "lorem ipsum",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
