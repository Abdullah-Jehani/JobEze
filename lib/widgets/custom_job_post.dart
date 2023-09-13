import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/widgets/custom_button.dart';
import 'package:job_eze/models/job_model.dart';
import '../screens/detailed_job_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFFF8F8F8),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: size.height * .50,
                  width: size.width * .90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFDDDEE3)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    widget.jobModel.companyName,
                    style: TextStyle(
                        fontFamily: 'poppins',
                        color: mainFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: secondaryFont, // Set the color of the line
                      thickness: 1.0,
                    ),
                  ),
                  Image.asset(
                    'assets/images/Screenshot_2023-09-10_204443-removebg-preview.png',
                    height: 200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: secondaryFont,
                      thickness: .50,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25, left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          textColor: mainFont,
                          color: mainFont,
                          icon: const Icon(Icons.location_on),
                          text: widget.jobModel.location.substring(
                              0,
                              widget.jobModel.location.contains(',')
                                  ? widget.jobModel.location.indexOf(',') + 1
                                  : widget.jobModel.location.length),
                          backColor: const Color(0xFF41A87E),
                        ),
                        CustomButton(
                          textColor: secondaryFont,
                          color: Colors.white,
                          icon: const Icon(Icons.arrow_forward),
                          text: 'Details',
                          backColor: mainFont,
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const DetailedJobScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
