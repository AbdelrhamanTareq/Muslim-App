import 'package:flutter/material.dart';





class SurhNameCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = Color.fromARGB(255, 88, 88, 87)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*1.3/6,size.height*0);
    path0.lineTo(size.width*4.7/6,size.height*0);
    path0.lineTo(size.width,size.height*0.5);
    path0.lineTo(size.width*4.7/6,size.height);
    path0.lineTo(size.width*1.3/6,size.height);
    path0.lineTo(size.width*0,size.height*0.5);
    path0.lineTo(size.width*1.3/6,size.height*0);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

