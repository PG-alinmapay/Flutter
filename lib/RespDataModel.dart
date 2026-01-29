class RespDataModel
{
  String resKey ="";
  String resValue ="";


  RespDataModel({required this.resKey, required this.resValue});


  @override
  String toString() {
    // TODO: implement toString
    return '{ ${this.resKey}, ${this.resValue} }';
  }

  // factory RespDataModel.fromJson(Map<String, dynamic> json)
  // {
  //   RespDataModel pay;
  //   pay=RespDataModel(
  //       resKey:json['key'] as String,
  //     resValue:json['value'] as String,
  //    );
  //   return pay;
  // }
  //
  //
  // Map toMap() {
  //   var map = new Map<String, dynamic>();
  //   map["devicemodel"] = devicemodel;
  //   map["deviceVersion"] = deviceVersion;
  //
  //   return map;
  // }


}