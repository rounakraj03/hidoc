import 'dart:convert';
import 'package:flutter/material.dart';

Image base64ToImage(String base64){
  return Image.memory(base64Decode(base64));
}