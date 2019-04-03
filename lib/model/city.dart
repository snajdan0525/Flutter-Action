class CityInfo {
  String name;
  String alphaTag;
  String namePinyin;
  bool isShowStickSection;

  CityInfo(
      {this.name,
      this.alphaTag,
      this.namePinyin,
      this.isShowStickSection = true});

  @override
  String getAlphaTag() => alphaTag;

  @override
  bool showStickSectione() => isShowStickSection;
}
