import 'package:flutter/material.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/providers/job_provider.dart';

import 'package:job_eze/widgets/custom_job_post.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({super.key});

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
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
          elevation: 0,
          title: const Text(
            'Job Lists',
            style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10,
            ),
            itemCount: jobConsumer.jobs.length,
            itemBuilder: (context, index) {
              return jobConsumer.isLoading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color: purpleColor.withOpacity(0.2),
                            border:
                                Border.all(color: mainFont.withOpacity(0.3)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: SizedBox(
                          child: Shimmer.fromColors(
                              baseColor: purpleColor.withOpacity(0.2),
                              highlightColor: Colors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16))),
                              )),
                        ),
                      ),
                    )
                  : CustomJobWidget(jobModel: jobConsumer.jobs[index]);
            },
          ),
        ),
      );
    });
  }
}
