import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:schoolproject/models/teacher_list_model.dart';

class TeacherListScreenFirstRowWidget extends StatelessWidget {
  const TeacherListScreenFirstRowWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final TeacherListModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(model.profilePictureUrl),
                  minRadius: 50,
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: getFlag(model.country),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    model.teacherName,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Native Language:"),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: getFlag(model.country),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Average Rate "),
                      Text(model.averageRate.toString()),
                      Icon(
                        Icons.star,
                        color: Colors.amber[900],
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getFlag(String countryName) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black26,
        ),
      ]),
      child: CountryPickerUtils.getDefaultFlagImage(
        CountryPickerUtils.getCountryByName(countryName),
      ),
    );
  }
}
