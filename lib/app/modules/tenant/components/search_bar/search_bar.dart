import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key, this.onSearch, this.onCancel}) : super(key: key);

  final Function onSearch;
  final Function onCancel;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = new TextEditingController();
  bool _showBtn = false;
  bool _showSuffixBtn = false;
  void _toggleShowButton(showStatus) {
    setState(() {
      _showBtn = showStatus;
      _showSuffixBtn = showStatus;
    });
  }

  void _toggleShowSuffixButton(showStatus) {
    setState(() {
      _showSuffixBtn = showStatus;
    });
  }

  void handleCancel() {
    _toggleShowButton(false);
    _controller.clear();
    widget.onCancel();
    // 失去焦点
    FocusScope.of(context).requestFocus(FocusNode());
  }

  FocusNode focusNode = FocusNode();
// 输入框焦点事件的捕捉与监听
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          _showBtn = true;
        });
      }
    });
  }

//页面销毁
  @override
  void dispose() {
    super.dispose();
    //释放
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: Container(
                  height: 40,
                  child: TextField(
                    cursorColor: Color(0xff4953ed),
                    onChanged: (text) {
                      widget.onSearch(text);
                      if (text.length > 0) {
                        _toggleShowButton(true);
                        _toggleShowSuffixButton(true);
                      } else {
                        _toggleShowSuffixButton(false);
                      }
                    },
                    controller: _controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFC1C0C8),
                      ),
                      suffixIcon: _showSuffixBtn
                          ? Container(
                              child: GestureDetector(
                              onTap: () {
                                widget.onCancel();
                                _controller.clear();
                                _toggleShowSuffixButton(false);
                              },
                              child: new SvgPicture.asset(
                                'assets/icons/clear.svg',
                                fit: BoxFit.scaleDown,
                              ),
                            ))
                          : null,
                      contentPadding: EdgeInsets.all(0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF4953ED), //边框颜色为绿色
                            width: 1, //宽度为5
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC1C0C8),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Color(0xffC1C0C8)),
                    ),
                  ))),
          SizedBox(
            width: _showBtn ? 70 : 0,
            height: 40,
            child: _showBtn
                ? TextButton(
                    onPressed: () {
                      handleCancel();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Avenir-Heavy',
                        fontSize: 16,
                        color: const Color(0xff4953ed),
                      ),
                    ))
                : null,
          )
        ],
      ),
    );
  }
}
