import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:github/github.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app/pages/repo_list_page.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 1600;

    return Container(
      width: double.infinity,
      height: 832,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 1600,
                height: 832,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(00),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1E120F28),
                      spreadRadius: 0,
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    )
                  ],
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D0C20), Color(0xFF42425C)],
                    stops: [0.25, 1],
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 443,
                      top: 326,
                      child: SizedBox(
                        width: 628,
                        height: 79,
                        child: Text(
                          'Welcome to NeedFit Agent',
                          style: GoogleFonts.getFont(
                            'Lexend',
                            color: const Color(0xFFBDC1CA),
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 563,
                      top: 428,
                      child: GithubSignInButton(), // Add the GitHub Sign-In button here
                    ),
                    Positioned(
                      left: 666,
                      top: 190,
                      child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2F0RRi8ZG5hNC7PDfvyx8f%2F9e677c39eb69afa52231b9cc4a4e34397150d7a0Super%20Sogbu%20(2)%201.png?alt=media&token=508f958d-9e54-4906-aab9-5b95d3ea5c6c',
                        width: 105,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GithubSignInButton extends StatelessWidget {
  const GithubSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse('https://github.com/login/oauth/authorize?client_id=Ov23li4tG3rPkYeswRtP');
        // Navigator.push(context, new MaterialPageRoute(builder: (context) => RepoListPage(githubUsername: githubUsername)));
        if (!await launchUrl(url)) {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        width: 315,
        height: 65,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 88,
              top: 17,
              child: Text(
                'Sign in with GitHub',
                style: GoogleFonts.getFont(
                  'Manrope',
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.5,
                ),
              ),
            ),
            Positioned(
              left: 58,
              top: 21,
              child: Container(
                width: 23,
                height: 23,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 2,
                      top: 2,
                      child: Image.network(
                        'https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2F0RRi8ZG5hNC7PDfvyx8f%2F9be714fbfaa7abdf07b2f1512fc25dd2.png',
                        width: 20,
                        height: 19,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}