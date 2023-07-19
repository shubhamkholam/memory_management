import '../Model/TileModel.dart';

String selectedTile = "";
int selectedIndex=0;
bool selected = true;
int points = 0;

late List<ImageModel> myPairs ;
late List<bool> clicked ;

List<bool> getClicked(){

    List<bool>? yoClicked;
  late List<ImageModel> myairs ;
  myairs = getPairs();
  for(int i=0;i<myairs.length;i++){
    yoClicked![i] = false;
  }

  return yoClicked!;
}

List<ImageModel>  getPairs(){

   List<ImageModel> pairs=[] ;

   ImageModel imageModel = new ImageModel();

  //1
  imageModel.setImageAssetPath("assets/a.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //2
  imageModel.setImageAssetPath("assets/c.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //3
  imageModel.setImageAssetPath("assets/f.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //4
  imageModel.setImageAssetPath("assets/d.jpg");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();
  //5
  imageModel.setImageAssetPath("assets/b.jpg");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //6
  imageModel.setImageAssetPath("assets/g.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //7
  imageModel.setImageAssetPath("assets/e.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //8
  imageModel.setImageAssetPath("assets/h.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  return pairs;
}

List<ImageModel>  getQuestionPairs(){

  List<ImageModel>? pairs=[];

  ImageModel imageModel = new ImageModel();

  //1
  imageModel.setImageAssetPath("assets/question.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //2
  imageModel.setImageAssetPath("assets/question.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //3
  imageModel.setImageAssetPath("assets/question.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //4
  imageModel.setImageAssetPath("assets/question.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();
  //5
  imageModel.setImageAssetPath("assets/question.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //6
  imageModel.setImageAssetPath("assets/question.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //7
  imageModel.setImageAssetPath("assets/question.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  //8
  imageModel.setImageAssetPath("assets/question.png");
  imageModel.setIsSelected(false);
  pairs.add(imageModel);
  pairs.add(imageModel);
  imageModel = new ImageModel();

  return pairs;
}