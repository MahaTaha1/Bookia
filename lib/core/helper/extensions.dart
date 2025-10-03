
import 'package:flutter/material.dart';


extension Navigations on BuildContext {
  pushTo(Widget newScreen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => newScreen));
  }
}

//********************************************************************* */
extension Sizing on num {
  Widget get h {
    return SizedBox(height: toDouble(),);
  }
}

//********************************************************************* */
