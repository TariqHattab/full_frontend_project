import 'package:snam/utils/enums.dart';

var privatekpCurrentUser = CurrentUser.landOwner;
set kpCurrentUser(CurrentUser currentUser) =>
    privatekpCurrentUser = currentUser;

CurrentUser get kpCurrentUser => privatekpCurrentUser;

// screen width to calculate the relative percent from
//e.g. an image has width of 43 we divide it with
//kpRelativeScreenWidth to get percent then multiply it with the screen width.
final double kpRelativeScreenWidth = 411.423;

// screen is considered small when less than 411
final double kpmiddelScreenWidth = 411;

// isSmallScreen is set at the start as the first child of mediaquary in main file
bool privateIsSmallScreen = false;
set kpIsSmallScreen(bool isSmall) => privateIsSmallScreen = isSmall;

bool get kpIsSmallScreen => privateIsSmallScreen;

//current user screen width set at the start from main page
double privateCurrentUserScreenWidth = 350;
set kpCurrentUserScreenWidth(double currentUserScreenWidth) =>
    privateCurrentUserScreenWidth = currentUserScreenWidth;

double get kpCurrentUserScreenWidth => privateCurrentUserScreenWidth;
