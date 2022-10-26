import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:movie_app_view_layer/data/vos/check_out_data_vo.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/pages/search_cinema_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';

import '../data/models/movie_model.dart';
import '../data/models/movie_model_impl.dart';
import '../data/vos/cinema_vo.dart';
import '../resources/dimens.dart';
import '../viewitems/cinema_view.dart';
import '../widgets/location_text.dart';
import 'choose_seat_page.dart';
import 'package:intl/intl.dart';

class ChooseCinema extends StatefulWidget {
  const ChooseCinema({Key? key, this.checkOutData}) : super(key: key);

  final CheckOutDataVO? checkOutData;
  @override
  State<ChooseCinema> createState() => _ChooseCinemaState();
}

class _ChooseCinemaState extends State<ChooseCinema> {
  MovieModel mMovieModel = MovieModelImpl();

  late List<DateTime> times;
  late List<ConfigVO>? configs;
  List<CinemaVO>? cinemaList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    times = _generateTwoWeek();
    mMovieModel.getConfigFromDatabase().then((configList) {
      configs = configList;
      setState(() {});
    });
    _getCinema(times.first);
  }

  _getCinema(DateTime date) {
    // mMovieModel
    //     .getCinemaTimeSlot(DateFormat('yyyy-MM-dd').format(date))
    //     .then((cinemaTimeSlots) {
    //   cinemaList = cinemaTimeSlots;
    //   setState(() {});
    // });

    mMovieModel
        .getCinemaAndTimeSlotByDateFromDatabase(
            DateFormat('yyyy-MM-dd').format(date))
        .listen((cinemas) {
      cinemaList = cinemas;
      setState(() {});
    });
  }

  _getCinemaTimeSlot(DateTime time) {}

  @override
  Widget build(BuildContext context) {
    var resulationList = ['2D', '3D', '3D IMAX', '3d DBOX'];

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: LocationText(title: 'Yangon'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SearchCinemaPage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
              child: Icon(
                Icons.search,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: SizedBox(
              width: MARGIN_MEDIUM_2,
              height: MARGIN_MEDIUM_2,
              child: Image.asset(
                'assets/icons/filter_icon.png',
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: MARGIN_CARD_MEDIUM_2,
          ),
          SizedBox(
            height: CHOOSE_CINEMA_LIST_DATE_CARD_HEIGHT,
            child: DateViewSection(
              times: times,
              onTapDateCard: (time) {
                widget.checkOutData?.selectDate = time;
                _getCinema(time);
              },
            ),
          ),
          const SizedBox(
            height: MARGIN_LARGE,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM,
            ),
            child: ResulationView(resulationList: resulationList),
          ),
          const SizedBox(
            height: MARGIN_LARGE,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2,
            ),
            color: AVAILABLE_BACKGROUND_COLOR,
            child: AvailiableView(
              config: configs?.where((config) => config.id == 2).first,
            ),
          ),
          Expanded(
            child: CinemaListViewSection(
              cinemaList: cinemaList,
              onTapCinema: (cinema) {
                widget.checkOutData?.mCinema = cinema;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChooseSeatPage(
                      checkOutData: widget.checkOutData,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<DateTime> _generateTwoWeek() {
    List<DateTime> timeSloat = [];
    var currentTime = DateTime.now();

    for (int i = 0; i < 14; i++) {
      timeSloat.add(currentTime.add(Duration(days: i)));
    }

    return timeSloat;
  }
}

class AvailiableView extends StatelessWidget {
  const AvailiableView({
    this.config,
    Key? key,
  }) : super(key: key);

  final ConfigVO? config;
  @override
  Widget build(BuildContext context) {
    List status = config?.value.toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...status.map(
          (value) => AvailiableItem(
            color: Color(
              int.parse(
                value['color'].toString().replaceRange(0, 1, '0xFF'),
              ),
            ),
            title: value['title'],
          ),
        ),
      ],
    );
  }
}

class CinemaListViewSection extends StatelessWidget {
  const CinemaListViewSection({
    this.cinemaList,
    required this.onTapCinema,
    Key? key,
  }) : super(key: key);

  final List<CinemaVO>? cinemaList;
  final Function(CinemaVO?) onTapCinema;
  @override
  Widget build(BuildContext context) {
    return cinemaList == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            shrinkWrap: true,
            itemCount: cinemaList?.length ?? 0,
            itemBuilder: (context, index) {
              var cinema = cinemaList?[index];
              return CinemaView(
                (timeSlot) {
                  cinema?.timeSlot = timeSlot;
                  onTapCinema(cinema);
                },
                cinema: cinema,
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.grey,
            ),
          );
  }
}

class AvailiableItem extends StatelessWidget {
  const AvailiableItem({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Center(
        child: Icon(
          Icons.circle,
          size: MARGIN_MEDIUM,
          color: color,
        ),
      ),
      label: Text(
        title,
        style: GoogleFonts.inter(
          color: color,
          fontSize: MARGIN_MEDIUM_2,
        ),
      ),
    );
  }
}

class ResulationView extends StatelessWidget {
  const ResulationView({
    Key? key,
    required this.resulationList,
  }) : super(key: key);

  final List<String> resulationList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: MARGIN_MEDIUM_3,
      children: resulationList
          .map(
            (e) => Chip(
              label: Text(
                e,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: MARGIN_MEDIUM_2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: const Color.fromRGBO(85, 85, 85, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  MARGIN_SMALL,
                ),
              ),
              side: const BorderSide(
                color: Colors.white,
              ),
            ),
          )
          .toList(),
    );
  }
}

class DateViewSection extends StatefulWidget {
  const DateViewSection({
    required this.times,
    required this.onTapDateCard,
    Key? key,
  }) : super(key: key);

  final List<DateTime> times;
  final Function(DateTime) onTapDateCard;

  @override
  State<DateViewSection> createState() => _DateViewSectionState();
}

class _DateViewSectionState extends State<DateViewSection> {
  int indexStack = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.times.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(
        left: MARGIN_CARD_MEDIUM_2,
      ),
      itemBuilder: (context, index) {
        var time = widget.times[index];
        return GestureDetector(
          onTap: () {
            widget.onTapDateCard(time);
            setState(() {
              indexStack = index;
            });
          },
          child: Container(
            width: CHOOSE_CINEMA_DATE_CARD_WIDTH,
            margin: const EdgeInsets.only(
              right: MARGIN_MEDIUM_3,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/DateCard.png',
                    fit: BoxFit.cover,
                    color: indexStack == index ? PRIMARY_COLOR : null,
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: DateInfoView(time),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DateInfoView extends StatelessWidget {
  final DateTime time;
  const DateInfoView(
    this.time, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AutoSizeText(
          checkTime(time),
          maxLines: 1,
          style: GoogleFonts.inter(
            //fontSize: MARGIN_MEDIUM_2,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          Jiffy(time).MMM,
          style: GoogleFonts.inter(
            fontSize: MARGIN_MEDIUM_2,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        AutoSizeText(
          Jiffy(time).format('d'),
          maxLines: 1,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  String checkTime(DateTime time) {
    var now = DateTime.now();
    var tomorrow = now.add(const Duration(days: 1));

    if (time.day == now.day) {
      return 'Today';
    } else if (time.day == tomorrow.day) {
      return 'Tomorrow';
    } else {
      return Jiffy(time).E;
    }
  }
}
