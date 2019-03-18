import 'package:flutter/material.dart';
import 'package:movie_app/common/HttpHandler.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}
class _HomeState extends State<Home> {

  @override
  void initState(){
    super.initState();
    _loadJson();
  }

  _loadJson() async {
    String data = await HttpHandler().fetchMovies();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Movie"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search, color: Colors.white,),
            onPressed: () {},
          )
        ],
      ),
      drawer: new Drawer(
        child: _getDrawer(context),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems(){
    return [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.thumb_up),
        title: new Text("Populares"), 
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.update),
        title: new Text("Próximamente"), 
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.star),
        title: new Text("Mejor Valoradas"), 
      ),
    ];
  }

  Drawer _getDrawer(BuildContext context){

    DrawerHeader header = new DrawerHeader(
      child: new Material(),
    ); 

    ListView listView = new ListView(
      children: <Widget>[
        header,
        _getItem(new Icon(Icons.local_movies), "Peliculas", ""),
        _getSeparator(),        
        _getItem(new Icon(Icons.tv), "Televisión", ""),
        _getSeparator(),        
        _getItem(new Icon(Icons.close), "Cerrar", ""),
        
      ],
    );

    return new Drawer(
      child: listView,
    );
  }

  ListTile _getItem(Icon icon, String description, String route) {
    return new ListTile(
      leading: icon,
      title: new Text(description),
      onTap: (){
        setState(() {
          Navigator.of(context).pushNamed(route);
        });
      },
    );
  }
  Divider _getSeparator(){
    return new Divider(
      height: 10.0,
    );
  }
}