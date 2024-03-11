import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Widget titletext(String text){
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: 24 ,
      fontWeight: FontWeight.bold,
      color: Colors.black

    ),
  );
}

Widget outlinetext(String text){
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.grey

    ),
  );
}
Widget expencetext(String text){
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: 20 ,
      fontWeight: FontWeight.bold,
      color: Colors.black

    ),
  );
}
Widget totalexpencetext(String text){
  return Text(
    text,
    style: GoogleFonts.hammersmithOne(
      fontSize: 50 ,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 32, 32, 32),
      shadows: [
          Shadow(
            blurRadius: 3.0,
            color: Color.fromARGB(255, 95, 255, 3),
            offset: Offset(1.5, 1.5),
          ),
        ],
        

    ),
  );
}

Widget expencecontainer(String text){
  Padding :const EdgeInsets.only(bottom: 10.0);
  return Container(
    height: 80,
    width: 350,
    decoration: BoxDecoration(
      
      borderRadius:BorderRadius.circular(25)
      ),
    
    child: Center(
      child:Text(" $text ",
      style: GoogleFonts.hammersmithOne(
        fontSize: 30,fontWeight: FontWeight.w600,color:Color.fromARGB(255, 5, 39, 231),


        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black,
            offset: Offset(5.0, 5.0),
          ),
        ],
        


        ),
    )
    )
  );
}
