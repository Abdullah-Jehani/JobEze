import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ooui.dart';
import 'package:iconify_flutter/icons/pajamas.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/providers/job_provider.dart';
import 'package:job_eze/models/job_model.dart';
import 'package:job_eze/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../screens/Home/detailed_job_screen.dart';

class CustomJobWidget extends StatefulWidget {
  const CustomJobWidget({
    super.key,
    required this.jobModel,
  });
  final JobModel jobModel;

  @override
  State<CustomJobWidget> createState() => _CustomJobWidgetState();
}

class _CustomJobWidgetState extends State<CustomJobWidget> {
  bool isPink = false;
  void toggleButton() {
    setState(() {
      isPink = !isPink;
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = isPink ? const Color(0xFFF87080) : Colors.grey;
    Size size = MediaQuery.of(context).size;
    return Consumer<JobProvider>(builder: (context, jobConsumer, child) {
      return Consumer<ThemeProvider>(builder: (context, themeConsumer, child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        DetailedJobScreen(jobModel: widget.jobModel)));
          },
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 115,
                          width: size.width * .95,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Color.fromARGB(255, 126, 125, 125),
                                  blurRadius: 2),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                  child: Image.asset(
                                    'assets/images/images.jpeg',
                                    fit: BoxFit.fitHeight,
                                    width: 105,
                                    height: 200,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Company Name
                                    Text(
                                      widget.jobModel.companyName
                                          .substring(
                                            0,
                                            widget.jobModel.companyName.length >
                                                    13
                                                ? 14
                                                : widget.jobModel.companyName
                                                    .length,
                                          )
                                          .replaceAll('-', '')
                                          .replaceAll('.', ''),
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: mainFont),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Iconify(
                                          Pajamas.location,
                                          size: 18,
                                          color: mainFont,
                                        ),
                                        const SizedBox(width: 5),
                                        // Location
                                        Text(
                                          widget.jobModel.location.substring(
                                            0,
                                            widget.jobModel.location
                                                    .contains(',')
                                                ? widget.jobModel.location
                                                        .indexOf(',') +
                                                    1
                                                : widget
                                                    .jobModel.location.length,
                                          ),
                                          style: TextStyle(
                                            color: themeConsumer.currentTheme
                                                ? purpleColor
                                                : const Color(0xFF808080),
                                            fontFamily: 'poppins',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Iconify(
                                          Pajamas.work,
                                          size: 18,
                                          color: mainFont,
                                        ),
                                        const SizedBox(width: 5),
                                        // Title
                                        Text(
                                          widget.jobModel.title
                                              .substring(
                                                0,
                                                widget.jobModel.title.length >
                                                        20
                                                    ? 21
                                                    : widget
                                                        .jobModel.title.length,
                                              )
                                              .replaceAll('(', '')
                                              .replaceAll(')', '')
                                              .replaceAll('/', '')
                                              .replaceAll('*', '')
                                              .replaceAll('-', ''),
                                          style: const TextStyle(
                                            color: Color(0xFF808080),
                                            fontFamily: 'poppins',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: toggleButton,
                                  child: Iconify(Ooui.reference,
                                      size: 26, color: iconColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
              // Stack(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20),
              //       child: Container(
              //         height: size.height * .50,
              //         width: size.width * .90,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             border: Border.all(color: const Color(0xFFDDDEE3)),
              //             borderRadius:
              //                 const BorderRadius.all(Radius.circular(16))),
              //       ),
              //     ),
              //     Column(
              //       children: [
              //         const SizedBox(
              //           height: 10,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 30),
              //           child: Row(
              //             children: [
              //               Text(
              //                 'company name',
              //                 style: TextStyle(
              //                     color: secondaryFont,
              //                     fontFamily: 'poppins',
              //                     fontSize: 14),
              //               ),
              //               const SizedBox(
              //                 width: 10,
              //               ),
              //               Text(
              //                 maxLines: 1,
              //                 widget.jobModel.companyName.substring(
              //                     0,
              //                     widget.jobModel.companyName.length > 19
              //                         ? 20
              //                         : widget.jobModel.companyName.length),
              //                 style: TextStyle(
              //                     fontFamily: 'poppins',
              //                     color: mainFont,
              //                     fontSize: 16),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 30),
              //           child: Row(
              //             children: [
              //               Text(
              //                 'Job title',
              //                 style: TextStyle(
              //                     color: secondaryFont,
              //                     fontFamily: 'poppins',
              //                     fontSize: 14),
              //               ),
              //               const SizedBox(
              //                 width: 10,
              //               ),
              //               Text(
              //                 maxLines: 1,
              //                 widget.jobModel.title
              //                     .substring(
              //                         0,
              //                         widget.jobModel.title.length > 20
              //                             ? 21
              //                             : widget.jobModel.title.length)
              //                     .replaceAll('(', '')
              //                     .replaceAll(')', '')
              //                     .replaceAll('/', '')
              //                     .replaceAll('*', '')
              //                     .replaceAll('-', ''),
              //                 style: TextStyle(
              //                     fontFamily: 'poppins',
              //                     color: mainFont,
              //                     fontSize: 15),
              //               ),
              //             ],
              //           ),
              //         ),
              //         const SizedBox(
              //           height: 5,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 30),
              //           child: Divider(
              //             color: secondaryFont, // Set the color of the line
              //             thickness: 1.0,
              //           ),
              //         ),
              //         Image.asset(
              //           'assets/images/download__3_-removebg-preview.png',
              //           height: 200,
              //         ),
              //         const SizedBox(
              //           height: 10,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 30),
              //           child: Divider(
              //             color: secondaryFont,
              //             thickness: .50,
              //           ),
              //         ),
              //         const SizedBox(
              //           height: 12,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(right: 25, left: 0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               CustomButton(
              //                 textColor: mainFont,
              //                 color: mainFont,
              //                 icon: const Icon(Icons.location_on),
              //                 text: widget.jobModel.location.substring(
              //                     0,
              //                     widget.jobModel.location.contains(',')
              //                         ? widget.jobModel.location.indexOf(',') + 1
              //                         : widget.jobModel.location.length),
              //                 backColor: const Color(0xFF41A87E),
              //               ),
              //               CustomButton(
              //                 textColor: secondaryFont,
              //                 color: Colors.white,
              //                 icon: const Icon(Icons.arrow_forward),
              //                 text: 'Details',
              //                 backColor: mainFont,
              //                 onPressed: () {
              //                   Navigator.push(
              //                     context,
              //                     CupertinoPageRoute(
              //                         builder: (context) => DetailedJobScreen(
              //                               jobModel: widget.jobModel,
              //                             )),
              //                   );
              //                 },
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     )
              //   ],
              // )
            ],
          ),
        );
      });
    });
  }
}
