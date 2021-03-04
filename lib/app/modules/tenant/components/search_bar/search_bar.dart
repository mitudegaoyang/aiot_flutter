import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = new TextEditingController();
  bool _showBtn = true;
  void _toggleShowButton(showStatus) {
    setState(() {
      _showBtn = showStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_controller.text);
    return Container(
      child: Row(
        children: [
          Expanded(
              child: Container(
                  height: 40,
                  child: TextField(
                    onChanged: (text) {
                      if (text.length > 0) {
                        _toggleShowButton(false);
                      } else {
                        _toggleShowButton(true);
                      }
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Container(
                          child: SvgPicture.asset(
                            'assets/images/clear.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // suffixIcon: Icon('assets/images/clear.png'),
                        // suffixIconConstrain,
                        contentPadding: EdgeInsets.all(0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF4953ED), //边框颜色为绿色
                              width: 1, //宽度为5
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC1C0C8),
                              width: 1,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        hintText: 'search',
                        hintStyle: TextStyle()),
                  ))),
          SizedBox(
            width: !_showBtn ? 78 : 0,
            child: !_showBtn
                ? TextButton(
                    onPressed: () {
                      _toggleShowButton(true);
                      _controller.clear();
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
