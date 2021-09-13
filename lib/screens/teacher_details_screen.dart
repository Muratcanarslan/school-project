import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:schoolproject/blocs/bloc/teacher_details/bloc/teacher_details_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolproject/models/enums/lesson_type.dart';
import 'package:schoolproject/models/teacher_details_model.dart';
import 'package:chewie/chewie.dart';
import 'package:schoolproject/widgets/teacher_details_widgets/animated_container.dart';
import 'package:schoolproject/widgets/teacher_details_widgets/animated_heart.dart';
import 'package:schoolproject/widgets/teacher_details_widgets/main_container.dart';
import 'package:schoolproject/widgets/teacher_details_widgets/tab_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TeacherDetailsScreen extends StatefulWidget {
  const TeacherDetailsScreen({
    Key? key,
    required this.teacherId,
  }) : super(key: key);
  final int teacherId;

  @override
  _TeacherDetailsScreenState createState() => _TeacherDetailsScreenState();
}

class _TeacherDetailsScreenState extends State<TeacherDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<TeacherDetailsBloc>()
        .add(FetchTeacherEvent(teacherId: widget.teacherId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Details"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: context.read<TeacherDetailsBloc>(),
        builder: (context, state) {
          if (state is TeacherDetailsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TeacherDetailsLoadedState) {
            return TeacherDetailsMainWidget(
              model: state.model,
              controller: VideoPlayerController.network(
                  "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
            );
          } else if (state is TeacherDetailsErrorState) {
            return Center(
              child: Text("error"),
            );
          } else {
            return Text("");
          }
        },
      ),
    );
  }
}

class TeacherDetailsMainWidget extends StatefulWidget {
  const TeacherDetailsMainWidget({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);
  final TeacherDetailsModel model;
  final VideoPlayerController controller;

  @override
  _TeacherDetailsMainWidgetState createState() =>
      _TeacherDetailsMainWidgetState();
}

class _TeacherDetailsMainWidgetState extends State<TeacherDetailsMainWidget> {
  ScrollController controller = ScrollController();
  late ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: widget.controller,
    );
  }

  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: ListView(
            controller: controller,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                child: Chewie(controller: chewieController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(widget.model.profilePictureUrl),
                              radius: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              widget.model.teacherName,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Native Language:"),
                                getFlag(widget.model.country),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("From:"),
                              getFlag(widget.model.country),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: AnimatedHeart(
                                  isFav: widget.model.isFavorite,
                                  size: 30,
                                ),
                              ),
                              Expanded(
                                child: Icon(
                                  Icons.share,
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TabBarWidget(
                tabs: [
                  Tab(
                    child: Text(
                      "Overview",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Resume",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Reviews",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ],
                views: [
                  OverviewBody(model: widget.model),
                  ResumeBody(model: widget.model),
                  ReviewsBody(model: widget.model),
                ],
              ),
            ],
          ),
        ),
        AnimatedBottomContainer(
          controller: controller,
          model: widget.model,
        ),
      ],
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class ReviewsBody extends StatelessWidget {
  const ReviewsBody({
    Key? key,
    required this.model,
  }) : super(key: key);
  final TeacherDetailsModel model;

  @override
  Widget build(BuildContext context) {
    print("MODELLLLLLLLL ${model.comments.length}");
    return SingleChildScrollView(
      child: Column(
        children: [
          MainContainer(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Teacher Rate",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.amber[900]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          model.averageRating.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.amber[900]),
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: model.averageRating,
                        minRating: 1,
                        maxRating: 5,
                        itemSize: 20,
                        ignoreGestures: true,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        for (int i = 5; i >= 1; i--) ...{
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: RatingBar.builder(
                                  initialRating: i.toDouble(),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  itemSize: 16,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              Text(
                                "(${model.rateStatistics[i.toString()]})",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        }
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          MainContainer(
            child: Column(
              children: [
                for (int i = 0; i < model.comments.length; i++) ...{
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Center(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    model.comments[i].profilePictureUrl,
                                  ),
                                  radius: 40,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Text(model.comments[i].userName),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      model.comments[i].date,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                  RatingBar.builder(
                                    initialRating:
                                        model.comments[i].rate.toDouble(),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    ignoreGestures: true,
                                    itemSize: 13,
                                    itemPadding: EdgeInsets.only(right: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(model.comments[i].comment),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Divider(
                          color: Colors.black26,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResumeBody extends StatelessWidget {
  const ResumeBody({
    Key? key,
    required this.model,
  }) : super(key: key);
  final TeacherDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Certificates",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Divider(
                        color: Colors.black26,
                        height: 1,
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < model.certificates.length; i++) ...{
                  MainContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          model.certificates[i].name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "${model.certificates[i].from}-${model.certificates[i].to}",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(fontSize: 17),
                          ),
                        ),
                        Text(model.certificates[i].certificateDetails),
                      ],
                    ),
                  ),
                }
              ],
            ),
          ),
          MainContainer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Education Info",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Divider(
                        color: Colors.black26,
                        height: 1,
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < model.education.length; i++) ...{
                  MainContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            model.education[i].name,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "${model.education[i].from}-${model.education[i].to}",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(fontSize: 17),
                          ),
                        ),
                        Text(model.education[i].educationDetails),
                      ],
                    ),
                  ),
                }
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OverviewBody extends StatelessWidget {
  const OverviewBody({
    Key? key,
    required this.model,
  }) : super(key: key);

  final TeacherDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Teaches",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < model.teachedLanguage.length; i++) ...{
                      Padding(
                        child: getFlag(model.teachedLanguage[i], width: 27),
                        padding: EdgeInsets.only(right: 5),
                      ),
                    },
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "About Me",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(model.aboutMe),
              ],
            ),
          ),
          MainContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Lesson Types",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                for (int i = 0; i < model.lessonTypes.length; i++) ...{
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Text(
                          "${model.lessonTypes[i].getLessonTypeToString()} Lesson",
                        ),
                      ],
                    ),
                  ),
                }
              ],
            ),
          ),
          MainContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Teacher Avaibility",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SfCalendar(
                  view: CalendarView.week,
                  firstDayOfWeek: DateTime.now().weekday,
                  headerHeight: 0,
                  showCurrentTimeIndicator: false,
                  timeSlotViewSettings: TimeSlotViewSettings(
                    timeInterval: Duration(hours: 3),
                    timeIntervalHeight: 30,
                    minimumAppointmentDuration: Duration(hours: 1),
                  ),
                  dataSource: MeetingDataSource(getAppointments()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Appointment> getAppointments() {
    List<Appointment> meetings = List.empty(growable: true);
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 1, 0, 0);
    final DateTime endTime = startTime.add(Duration(hours: 5));

    meetings.add(
      Appointment(
        startTime: startTime,
        endTime: endTime,
        /*recurrenceRule: 'FREG=WEEKLY;'*/
        subject: "Free Time",
      ),
    );
    return meetings;
  }
}

Widget getFlag(String countryName, {double width = 23}) {
  return Container(
    width: width,
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
