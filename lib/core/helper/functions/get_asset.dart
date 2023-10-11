String getSvgAsset(String fileName) => 'assets/svgs/$fileName.svg';
String getPngAsset(String fileName) => 'assets/images/$fileName.png';
String getJpgAsset(String fileName) => 'assets/images/$fileName.jpg';



extension Image on String{
  //String getSvgAsset() => 'assets/svgs/$this.svg';//==
  String get getSvgAsset => 'assets/svgs/$this.svg';  //("assets/images/logo.svg")===("logo".getSvgAsset)

}