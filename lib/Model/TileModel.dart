class ImageModel{

  String? imageAssetPath;
  bool? isSelected;

  ImageModel({this.imageAssetPath, this.isSelected});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  String? getImageAssetPath(){
    return imageAssetPath;
  }

  void setIsSelected(bool getIsSelected){
    isSelected = getIsSelected;
  }

  bool? getIsSelected(){
    return isSelected;
  }
}