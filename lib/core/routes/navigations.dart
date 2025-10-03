import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

pushTo(BuildContext context, String path) {
  context.push(path);
}

pushReplacementTo(BuildContext context, String path) {
  context.pushReplacement(path);
}

pushAndRemoveUntil(BuildContext context, String path) {
  context.go(path);
}

pop(BuildContext context) {
  context.pop();
}
