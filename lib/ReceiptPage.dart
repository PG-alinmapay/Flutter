import 'dart:convert';

import 'package:flutter/material.dart';

import 'RespDataModel.dart';

class ReceiptUpdatedPage extends StatefulWidget {
  // final String transId;
  // final String result;
  // final String amount;
  //
  // final String cardToken;
  // final String cardBrand;
  final String respFinalData;


  // final Map<String, dynamic> respFinalData;





  // ReceiptPage(this.transId,this.result,this.amount, this.cardToken,this.cardBrand,this.MaskedPan);
  ReceiptUpdatedPage(this.respFinalData);

  @override
  _MyReceiptPage createState() => _MyReceiptPage();
}

class _MyReceiptPage extends State<ReceiptUpdatedPage> {
  late Map<String, dynamic> mapResp;
  bool visibilityToken = false;
  List list = [];
  Map<String,String> mapData = Map();
  late String myData;
  List<MapEntry<String, String>> flattenedEntries = [];
  void _visibleDataList() {
    setState(() {


      // final parsedJson = json.decode(widget.respFinalData);

      final jsonData = widget.respFinalData;
      print('Payment RECEIPt  $jsonData');
      final decoded = jsonDecode(jsonData) as Map;
      decoded.forEach((key, value){
        print('key is $key');
        print('value is $value ');
        if([null,"null"].contains(value))
        {
          value= "";
        }
        // if(value.contains("%20"))
        // {
        //   print(" %20 "+ value);
        //   value = value.replaceAll("%20", " ");
        // }

        if (value is Map) {
          // Convert nested Map to JSON String
          list.add(RespDataModel(resKey: key, resValue: jsonEncode(value)));
        } else {
          // Handle as a regular string
          list.add(RespDataModel(resKey: key, resValue: value));
        }
      // list.add(RespDataModel(resKey: key, resValue: value));
      });
      // print(list);
      //print(mapData);//
      // final data = decoded['data'] as Map;
      // print(jsonData);
      // final body = json.decode(jsonData) as Map;
      // print(body);

     //  var dataSp = widget.respFinalData.split(',');
     //
     // // print(widget.respFinalData);
     //
     //  dataSp.forEach((element) => mapData[element.split(':')[0]] = element.split(':')[1]);
     //  print(mapData.keys);

      // mapResp = widget.respFinalData;
      // mapData.forEach((k, v) => list.add(RespDataModel(resKey: k, resValue: v)));
      // print(list);



       });

    }

    // String getlistData(String strlistrowvalue)
    // {
      String getstrfromList(String strlistrowvalue) {
        // Do whatever you want with `index`.
        // final image = await ImagePicker.pickImage(source: ImageSource.camera);
        //setState(() {
        // print(myData);
        //   myData = strlistrowvalue.replaceAll(RegExp('[{}]'), '');
        // myData = ""
          print(strlistrowvalue);
       // });
        return strlistrowvalue;
      }

    //}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _visibleDataList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Receipt Page'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: tableBody(
              context,
            ),
          ),

        ],
      ),

    );
  }

  SingleChildScrollView tableBody(BuildContext ctx) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 50,
          dividerThickness: 5,

          columns: [
            DataColumn(
              label: Text(
                "Key",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),
              ),
              numeric: false,
              tooltip: "This is First Name",

            ),
            DataColumn(
              label: Text(
                "Values",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),
              ),
              numeric: false,
              tooltip: "This is Values",
            ),


          ],
          rows: list
              .map(
                (list) => DataRow(
                cells: [
                  DataCell(
                    Text(list.resKey),
                  ),
                  DataCell(
                    Text(list.resValue),
                  ),

                ]),
          ) .toList(),
        ),
      ),
    );
  }
}

