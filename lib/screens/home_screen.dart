import 'package:fingerprint/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

class HomeScreen extends StatelessWidget {
  final LocalAuthentication localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/d.jpg"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Card(
                    color: Colors.white70,
                    child: Center(
                      child: Text(
                        "Fingerprint with localAuth",
                        style: GoogleFonts.passionOne(
                          fontSize: 64.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Card(
                    color: Colors.white70,
                    child: GestureDetector(
                      onTap: () async {
                        bool weCanCheckBiometrics =
                            await localAuth.canCheckBiometrics;

                        if (weCanCheckBiometrics) {
                          bool authenticated =
                              await localAuth.authenticateWithBiometrics(
                            localizedReason:
                                "Authenticate to see your bank statement.",
                          );

                          if (authenticated) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardScreen(),
                              ),
                            );
                          }
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Icon(
                            Icons.fingerprint,
                            size: 124.0,
                          ),
                          Text(
                            "Touch to Login",
                            style: GoogleFonts.passionOne(
                              fontSize: 32.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
