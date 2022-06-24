import 'package:feriavirtual/components/header.dart';
import 'package:flutter/material.dart';
import '/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageLogged extends StatelessWidget {
  const HomePageLogged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          color: backgroundColor,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/feriaVirtual1.jpg',
                    )),
              ),
              Container(
                width: screenWidth * 0.5,
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  "Bienvenido a la feria virtual 2022",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: blackColor),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 40),
                child: Text(
                  'La Feria Virtual Universitaria es un evento estatal que reúne a todos los programas educativos de nivel superior,en un esfuerzo por acercar la Oferta Educativa a todos los jóvenes que quieren continuar su formación cursando una carrera universitaria.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: blackColor),
                ),
              ),
              ElevatedButton(
                onPressed: () => null,
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(backgroundColor),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(20))),
                child: Text(
                  'Universidades',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: backgroundColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
