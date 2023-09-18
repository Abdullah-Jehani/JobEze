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
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Image.asset(
                'assets/images/download__3_-removebg-preview.png',
                width: 180,
              ),
            ),
            centerTitle: true,
            actions: [
              CustomIconButton(
                  icon: const Icon(Icons.favorite),
                  color: const Color.fromARGB(255, 226, 16, 1).withOpacity(.5),
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
                  height: 10,
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
                        color: mainFont,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Iconify(
                            Pajamas.location,
                            size: 30,
                            color: greenColor,
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
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: secondaryFont),
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
                            color: mainFont,
                            size: 30,
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
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: secondaryFont),
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
                            size: 30,
                            color: mainFont,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Text(
                            '2-3 years experience',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: secondaryFont),
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
                            color: greenColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '100K - 150K',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: secondaryFont),
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
                            size: 30,
                            color: mainFont,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Text(
                            widget.jobModel.remote
                                ? 'Remotely'
                                : 'In-Place Job',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: mainFont,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 22,
                                color: mainFont),
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
                                    .replaceAll('<p>', ''),
                                maxLines: 6,
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryFont),
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
                                    horizontal: 90, vertical: 10)),
                            backgroundColor:
                                MaterialStatePropertyAll(mainFont)),
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
  }
}
