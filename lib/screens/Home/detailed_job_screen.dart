import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/arcticons.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/pajamas.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/models/job_model.dart';
import 'package:job_eze/providers/job_provider.dart';
import 'package:job_eze/providers/theme_provider.dart';
import 'package:job_eze/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

// for

class DetailedJobScreen extends StatefulWidget {
  const DetailedJobScreen({super.key, required this.jobModel});
  final JobModel jobModel;

  @override
  State<DetailedJobScreen> createState() => _DetailedJobScreenState();
}

class _DetailedJobScreenState extends State<DetailedJobScreen> {
  @override
  void initState() {
    Provider.of<JobProvider>(context, listen: false).fetchJobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JobProvider>(builder: (context, jobConsumer, child) {
      return Consumer<ThemeProvider>(builder: (context, themeConsumer, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Details',
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                CustomIconButton(
                    icon: const Icon(Icons.favorite),
                    color:
                        const Color.fromARGB(255, 226, 16, 1).withOpacity(.9),
                    onpressed: () {}),
              ],
            ),
            // body: GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 1),
            //     itemBuilder: (context, index) {
            //       return CustomDetail(jobModel: jobConsumer.jobs[index]);
            //     }),

            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/images.jpeg',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      maxLines: 1,
                      widget.jobModel.companyName.substring(
                          0,
                          widget.jobModel.companyName.length > 19
                              ? 20
                              : widget.jobModel.companyName.length),
                      style: TextStyle(
                          fontFamily: 'poppins',
                          color: themeConsumer.currentTheme
                              ? Colors.white
                              : Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Iconify(
                              Pajamas.location,
                              size: 20,
                              color: themeConsumer.currentTheme
                                  ? purpleColor
                                  : mainFont,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              widget.jobModel.location.substring(
                                  0,
                                  widget.jobModel.location.length > 19
                                      ? 20
                                      : widget.jobModel.location.length),
                              style: const TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 14,
                                  color: Color(0xFF808080)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Iconify(
                              Bi.person_workspace,
                              color: themeConsumer.currentTheme
                                  ? purpleColor
                                  : mainFont,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              widget.jobModel.title.substring(
                                  0,
                                  widget.jobModel.title.length >= 22
                                      ? 23
                                      : widget.jobModel.title.length),
                              style: const TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 14,
                                  color: Color(0xFF808080)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Iconify(
                              Heroicons.calendar_days_20_solid,
                              size: 20,
                              color: themeConsumer.currentTheme
                                  ? purpleColor
                                  : mainFont,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            const Text(
                              '2-3 years experience',
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 14,
                                  color: Color(0xFF808080)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Iconify(
                              GameIcons.money_stack,
                              color: themeConsumer.currentTheme
                                  ? purpleColor
                                  : greenColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              '100K - 150K',
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 14,
                                  color: Color(0xFF808080)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Iconify(
                              widget.jobModel.remote
                                  ? Arcticons.remote_mouse
                                  : Healthicons.city,
                              size: 20,
                              color: themeConsumer.currentTheme
                                  ? purpleColor
                                  : mainFont,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              widget.jobModel.remote
                                  ? 'Remotely'
                                  : 'In-Place Job',
                              style: const TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 14,
                                color: Color(0xFF808080),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            Text(
                              'About Job',
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 18,
                                  color: themeConsumer.currentTheme
                                      ? purpleColor
                                      : Colors.black),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  widget.jobModel.description
                                      .replaceAll('</p>', ' ')
                                      .replaceAll('<p>', '')
                                      .replaceAll('/', '')
                                      .replaceAll('<br>', '')
                                      .replaceAll('<br />', '')
                                      .replaceAll('<em>', '')
                                      .replaceAll('<br>', '')
                                      .replaceAll('<strong>', '')
                                      .replaceAll('</strong>', '')
                                      .replaceAll('</em>', '')
                                      .replaceAll('<ul>', '')
                                      .replaceAll('</ul>', '')
                                      .replaceAll('<li>', '')
                                      .replaceAll('</li>', '')
                                      .replaceAll('<>', '')
                                      .replaceAll('>', '')
                                      .replaceAll('<', '')
                                      .replaceAll('href=', ''),
                                  maxLines: 6,
                                  style: const TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Color(0xFF808080)),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 90, vertical: 8)),
                              backgroundColor: themeConsumer.currentTheme
                                  ? const MaterialStatePropertyAll(
                                      Color(0xFFFF735C))
                                  : const MaterialStatePropertyAll(
                                      Color(0xFFF87080))),
                          child: const Text(
                            'Apply For Job ',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          onPressed: () async {
                            launcher.launchUrl(
                              Uri.parse(widget.jobModel.url.toString()),
                              mode: launcher.LaunchMode.externalApplication,
                            );
                            if (kDebugMode) {
                              print(' STATUS : clicked');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      });
    });
  }
}
