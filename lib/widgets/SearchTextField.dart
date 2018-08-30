import 'package:flutter_music/baseImport.dart';
import 'package:flutter_music/inheritedWidgetImport.dart'
    show HotKeyWordInheritedWidget;

class SearchTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    HotKeyWordInheritedWidget inheritedWidget =
        HotKeyWordInheritedWidget.of(context);
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
      height: 40.0,
      child: Material(
        borderRadius: BorderRadius.circular(6.0),
        color: COLOR_GRAY,
        child: Row(
          children: <Widget>[
            Image.asset('images/search.png', width: 26.0, height: 26.0),
            Expanded(
              child: TextField(
                cursorColor: COLOR_WHITE,
                cursorWidth: 1.0,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '搜索歌曲、歌手',
                    hintStyle: TextStyle(
                        color: COLOR_TRANSLUCENT_WHITE_ZERO_POINT_THREE,
                        fontSize: 14.0)),
                style: TextStyle(fontSize: 14.0, color: COLOR_WHITE),
                controller: TextEditingController.fromValue(TextEditingValue(
                    // 设置内容
                    text: inheritedWidget.keyword,
                    // 保持光标在最后
                    selection: TextSelection.fromPosition(TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: inheritedWidget.keyword.length)))),
                onChanged: (text) {
                  setState(() {
                    inheritedWidget.keyword = text;
                  });
                },
              ),
              flex: 1,
            ),
            // 清空按钮
            Offstage(
              offstage: inheritedWidget.keyword.isEmpty,
              child: GestureDetector(
                child: Container(
                  width: 46.0,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Image.asset('images/close.png',
                      width: 14.0, height: 14.0),
                ),
                onTap: () {
                  setState(() {
                    inheritedWidget.keyword = '';
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
