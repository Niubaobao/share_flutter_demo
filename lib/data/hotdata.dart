class HotListData {
  String _tmpHref;
  String _tmpTitle;
  String _tmpHot;
  String _tmpContent;
  String _tmpPicHref;
  String _tmpIndex;

  HotListData(
      {String tmpHref,
        String tmpTitle,
        String tmpHot,
        String tmpContent,
        String tmpPicHref,
        String tmpIndex}) {
    this._tmpHref = tmpHref;
    this._tmpTitle = tmpTitle;
    this._tmpHot = tmpHot;
    this._tmpContent = tmpContent;
    this._tmpPicHref = tmpPicHref;
    this._tmpIndex = tmpIndex;
  }

  String get tmpHref => _tmpHref;
  set tmpHref(String tmpHref) => _tmpHref = tmpHref;
  String get tmpTitle => _tmpTitle;
  set tmpTitle(String tmpTitle) => _tmpTitle = tmpTitle;
  String get tmpHot => _tmpHot;
  set tmpHot(String tmpHot) => _tmpHot = tmpHot;
  String get tmpContent => _tmpContent;
  set tmpContent(String tmpContent) => _tmpContent = tmpContent;
  String get tmpPicHref => _tmpPicHref;
  set tmpPicHref(String tmpPicHref) => _tmpPicHref = tmpPicHref;
  String get tmpIndex => _tmpIndex;
  set tmpIndex(String tmpIndex) => _tmpIndex = tmpIndex;

  HotListData.fromJson(Map<String, dynamic> json) {
    _tmpHref = json['tmpHref'];
    _tmpTitle = json['tmpTitle'];
    _tmpHot = json['tmpHot'];
    _tmpContent = json['tmpContent'];
    _tmpPicHref = json['tmpPicHref'];
    _tmpIndex = json['tmpIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tmpHref'] = this._tmpHref;
    data['tmpTitle'] = this._tmpTitle;
    data['tmpHot'] = this._tmpHot;
    data['tmpContent'] = this._tmpContent;
    data['tmpPicHref'] = this._tmpPicHref;
    data['tmpIndex'] = this._tmpIndex;
    return data;
  }
}