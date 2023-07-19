import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/data.dart';
import '../Model/TileModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ImageModel> gridViewTiles;
  late List<ImageModel> questionPairs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reStart();
  }
  void reStart() {

    myPairs = getPairs();
    myPairs.shuffle();

    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 5), () {

      setState(() {

        // Here you can write your code for open new view
        questionPairs = getQuestionPairs();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              height: 80,
              width: 200,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24),
              ),
              child: points != 8 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Your Points",
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "$points/8",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ],
              ) : Container(),
            ),

            SizedBox(
              height: 20,
            ),
            points != 8 ? GridView(
              shrinkWrap: true,
              //physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
              children: List.generate(gridViewTiles.length, (index) {
                return Tile(
                  imagePathUrl: gridViewTiles[index].getImageAssetPath()!,
                  tileIndex: index,
                  parent: this,
                );
              }),
            ) : Container(
                color: Colors.amber,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      points = 0;
                      reStart();
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text("Replay Game", style: TextStyle(
                      color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}



class Tile extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _HomePageState parent;

  Tile({required this.imagePathUrl, required this.tileIndex, required this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {

              points = points + 1;

              ImageModel imageModel = ImageModel();

              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                imageModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = imageModel;
                myPairs[selectedIndex] = imageModel;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {

              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetPath()!;
              selectedIndex = widget.tileIndex;
            });

          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex].getIsSelected()!
            ? myPairs[widget.tileIndex].getImageAssetPath()!
            : widget.imagePathUrl)
            : Container(
          color: Colors.white,
          child: Image.asset("assets/correct.png"),
        ),
      ),
    );
  }
}
