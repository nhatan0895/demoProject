import 'package:flutter/cupertino.dart';
import 'package:practice1/core/constants/color.dart';
import 'package:practice1/core/constants/dismension.dart';
import 'package:practice1/representation/widgets/app_bar_container.dart';
import 'package:practice1/representation/widgets/button_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateScreen extends StatelessWidget {
  static const String routeName = '/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Select Date',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 2,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              } else {
                rangeStartDate = null;
                rangeEndDate = null;
              }
            },
          ),
          ButtonWidget(
            title: 'Select',
            ontap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            ontap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
        ],
      ),
    );
  }
}
