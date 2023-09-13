import 'package:flutter/cupertino.dart';
import 'package:job_eze/models/job_model.dart';

class CustomDetail extends StatefulWidget {
  const CustomDetail({super.key, required this.jobModel});

  final JobModel jobModel;
  @override
  State<CustomDetail> createState() => _CustomDetailState();
}

class _CustomDetailState extends State<CustomDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.jobModel.companyName),
      ],
    );
  }
}
