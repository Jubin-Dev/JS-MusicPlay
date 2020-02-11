import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'dart:io';
import 'dart:math';

import 'package:jsmusicplay/util/lastplay.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  List<Song> songs;
  bool isLoading = true;
  int noOfFavorites;
  Song last;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  dynamic getImage(Song song) {
    return song.albumArt == null
        ? null
        : new File.fromUri(Uri.parse(song.albumArt));
  }

  void init() async {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return new Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        new SliverAppBar(
          expandedHeight: 180.0,
          floating: true,
          elevation: 0.0,
          pinned: false,
          primary: true,
          title: Text("J-Player",
              style: TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Quicksand',
                  letterSpacing: 1.3)),
          backgroundColor: Colors.white30,
          brightness: Brightness.light,
          leading: Padding(
            child: Image.asset("images/icon.png", color: Colors.tealAccent),
            padding: EdgeInsets.all(15.0),
          ),
          actions: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.tealAccent,
              ),
              onPressed: () {
                // Do something
              },
            ),
            new IconButton(
              icon: Icon(Icons.search, color: Colors.tealAccent),
              onPressed: () {},
            )
          ],
          flexibleSpace: new FlexibleSpaceBar(
            background: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Image.asset(
                  "images/back.jpg",
                  fit: BoxFit.fitWidth,
                )
                //do more if image swapping in future
              ],
            ),
          ),
        ),
        new SliverList(
          delegate: !isLoading
              ? new SliverChildListDelegate(<Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, top: 15.0, bottom: 10.0),
                    child: Center(
                      child: Text(
                        "ARTIST NAME - SONU NIGAM",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 16.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 15.0, bottom: 10.0),
                    child: new Text(
                      "QUICK ACTIONS",
                      style: new TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          fontFamily: 'Quicksand',
                          letterSpacing: 2.0,
                          color: Colors.black.withOpacity(0.75)),
                    ),
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new RawMaterialButton(
                                shape: CircleBorder(),
                                fillColor: Colors.transparent,
                                splashColor: Colors.blueGrey[200],
                                highlightColor:
                                    Colors.blueGrey[200].withOpacity(0.3),
                                elevation: 20.0,
                                highlightElevation: 1.0,
                                disabledElevation: 1.0,
                                onPressed:
                                    () {}, // navigate to diffrent screen pending
                                child: new Icon(
                                  CupertinoIcons.check_mark_circled_solid,
                                  size: 70.0,
                                  color: Colors.tealAccent[400],
                                ),
                              ),
                              new Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0)),
                              new Text(
                                "TOP SONGS",
                                style: new TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 12.0,
                                    letterSpacing: 2.0),
                              ),
                            ]),
                        new Column(children: <Widget>[
                          new RawMaterialButton(
                            shape: CircleBorder(),
                            fillColor: Colors.transparent,
                            splashColor: Colors.blueGrey[200],
                            highlightColor:
                                Colors.blueGrey[200].withOpacity(0.3),
                            elevation: 20.0,
                            highlightElevation: 1.0,
                            disabledElevation: 1.0,
                            onPressed:
                                () {}, // navigate to diffrent screen pending
                            child: new Icon(
                              CupertinoIcons.double_music_note,
                              size: 70.0,
                              color: Colors.tealAccent[400],
                            ),
                          ),
                          new Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0)),
                          new Text(
                            "RANDOM",
                            style: new TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 12.0,
                                letterSpacing: 2.0),
                          ),
                        ]),
                        new Column(children: <Widget>[
                          new RawMaterialButton(
                            shape: CircleBorder(),
                            fillColor: Colors.transparent,
                            splashColor: Colors.blueGrey[200],
                            highlightColor:
                                Colors.blueGrey[200].withOpacity(0.3),
                            elevation: 20.0,
                            highlightElevation: 1.0,
                            disabledElevation: 1.0,
                            onPressed:
                                () {}, // navigate to diffrent screen pending
                            child: new Icon(
                              CupertinoIcons.shuffle_thick,
                              size: 70.0,
                              color: Colors.tealAccent[400],
                            ),
                          ),
                          new Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0)),
                          new Text(
                            "RECENTS",
                            style: new TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 12.0,
                                letterSpacing: 2.0),
                          ),
                        ]),
                      ]),

                  //RECENTS HORIZONTAL LISTS HERE

                  Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                  new Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 15.0, bottom: 10.0),
                    child: new Text(
                      "YOUR RECENTS!",
                      style: new TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          fontFamily: 'Quicksand',
                          letterSpacing: 2.0,
                          color: Colors.black.withOpacity(0.75)),
                    ),
                  ),
                  recentList()
                ])
              : new SliverChildListDelegate(<Widget>[
                  new Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: new CircularProgressIndicator(
                        backgroundColor: Colors.blueGrey[200],
                      ),
                    ),
                  )
                ]),
        ),
      ]),
    );
  }

  Widget recentList() {
    return new Container(
      height: 215.0,
      child: FutureBuilder(
        builder: (context, AsyncSnapshot<List<Song>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              List<Song> recents = snapshot.data;
              return ListView.builder(
                itemCount: recents.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: InkWell(
                    onTap: () {
                      MyQueue.songs = recents;
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        // return new NowPlaying(widget.db, recents, i, 0);
                      }));
                    },
                    child: new Card(
                      elevation: 12.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: Hero(
                                tag: recents[i].id,
                                child: getImage(recents[i]) != null
                                    ? Container(
                                        height: 120.0,
                                        width: 180.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: FileImage(
                                            getImage(recents[i]),
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                      )
                                    : new Image.asset(
                                        "images/back.jpg",
                                        height: 120.0,
                                        width: 180.0,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SizedBox(
                                width: 180.0,
                                child: Padding(
                                  // padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        recents[i].title,
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.black.withOpacity(0.70)),
                                        maxLines: 1,
                                      ),
                                      SizedBox(height: 5.0),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Text(
                                          recents[i].artist,
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black
                                                  .withOpacity(0.75)),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
          }
          return Text('end');
        },
      ),
    );
  }
}
