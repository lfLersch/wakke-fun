import 'package:flutter/material.dart';
import 'package:wakke_fun/helpers/index.dart';
import 'package:wakke_fun/screens/feed-screen.dart';
import 'package:wakke_fun/screens/game-screen.dart';
import 'package:wakke_fun/screens/notification-screen.dart';
import 'package:wakke_fun/screens/profile_screen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PrincipalManager extends StatefulWidget {
  static const String id = 'principal_manager';
  const PrincipalManager({Key? key}) : super(key: key);

  @override
  State<PrincipalManager> createState() => _PrincipalManagerState();
}

class _PrincipalManagerState extends State<PrincipalManager> with SingleTickerProviderStateMixin{
  final Index _index = Index();
  bool isSearching = false;
  late FocusNode _focusNode;
  late PageController pageController;

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
      backgroundColor: Colors.grey.shade200,
      appBar: buildAppBar(),
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
      child: Observer(builder: (_) =>
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: ImageIcon(
                const AssetImage('images/icon_header_menu.png'),
                color: _index.value == 0 ? Colors.deepPurple : Colors.black87,
              ),
              onPressed: () {
                if(_index.value != 0){
                  pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                }
              },
            ),
            IconButton(
              icon: ImageIcon(
                const AssetImage('images/icon_add.png'),
                color: _index.value == 1 ? Colors.deepPurple : Colors.black87,
              ),
              onPressed: () {
                if(_index.value != 1){
                  pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
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
                if(_index.value != 2){
                  pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                }
              },
            ),
            IconButton(
              icon: ImageIcon(
                const AssetImage('images/icon_notificacoes.png',),
                color: _index.value == 3 ? Colors.deepPurple : Colors.black87,
              ),
              onPressed: () {
                if(_index.value != 3){
                  pageController.animateToPage(3, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
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
      onPressed: () {},
      backgroundColor: null,
      child: const Align(
          alignment: Alignment.center,
          child:
              Image(image: AssetImage('images/button_fun.png'), height: 60)),
    );
  }

  PageView buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        _index.setValue(pageController.page!.round());
      },
      children: const [FeedScreen(),GameScreen(),ProfileScreen(),NotificationScreen(),],);
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        title: isSearching ? TextFormField(focusNode: _focusNode) : const Image(
          image: AssetImage('images/logo_wakke_roxo.png'),
          height: 20,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const ImageIcon(AssetImage('images/icon_header_menu.png'),
              color: Colors.deepPurple),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: isSearching ? const ImageIcon(AssetImage('images/icon_input_delete_branco.png'),
    color: Colors.deepPurple) : const ImageIcon(AssetImage('images/icon_header_search.png'),
                color: Colors.deepPurple),
            onPressed: () {
              setState((){
                isSearching = !isSearching;
                _focusNode.requestFocus();
              });
            },
          )
        ]);
  }
}
