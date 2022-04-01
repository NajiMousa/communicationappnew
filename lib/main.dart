
import 'package:communication/pref/shread_pref.dart';
import 'package:communication/screens/auth_screens/add_code_screen.dart';
import 'package:communication/screens/auth_screens/all_widget.dart';
import 'package:communication/screens/auth_screens/create_account_screen.dart';
import 'package:communication/screens/auth_screens/recovery_account_screen.dart';
import 'package:communication/screens/display/course_info_screen.dart';
import 'package:communication/screens/display/job_info_screen.dart';
import 'package:communication/screens/nav_user_screens/home_screen.dart';
import 'package:communication/screens/nav_user_screens/job_screen.dart';
import 'package:communication/screens/nav_user_screens/learn_screen.dart';
import 'package:communication/screens/nav_user_screens/main_screen.dart';
import 'package:communication/screens/nav_user_screens/map_screen.dart';
import 'package:communication/screens/nav_user_screens/request%20_screen.dart';
import 'package:communication/screens/nav_user_screens/settings%20_screen.dart';
import 'package:communication/screens/translator_screens/blog_info_screen.dart';
import 'package:communication/screens/onboarding_screen_s/onboarding_first_screen.dart';
import 'package:communication/screens/onboarding_screen_s/onboarding_second_screen.dart';
import 'package:communication/screens/onboarding_screen_s/onboarding_third_screen.dart';
import 'package:communication/screens/other_screens/no_connection_screen.dart';
import 'package:communication/screens/other_screens/success_send_screen.dart';
import 'package:communication/screens/other_screens/thank_you_screen.dart';
import 'package:communication/screens/nafication_screens/nafication_screen.dart';
import 'package:communication/screens/request_screens/add_request_screen.dart';
import 'package:communication/screens/nafication_screens/empty_nafication_screen.dart';
import 'package:communication/screens/translator_screens/nav_translator_screens/home_screen.dart';
import 'package:communication/screens/translator_screens/nav_translator_screens/main_translator_screen.dart';
import 'package:communication/screens/translator_screens/request_details_translator_screen.dart';
import 'package:communication/screens/settings_screens/about_us_screen.dart';
import 'package:communication/screens/settings_screens/help_faqs_screen.dart';
import 'package:communication/screens/auth_screens/login_screen.dart';
import 'package:communication/screens/settings_screens/privacy_policy_screen.dart';
import 'package:communication/screens/settings_screens/terms_conditions_screen.dart';
import 'package:communication/screens/tabbar_screen/profile_screens/my_evaluation_screen.dart';
import 'package:communication/screens/user_profile_screens/edit_profile_user_screen.dart';
import 'package:communication/screens/user_profile_screens/evaluation_person_screen.dart';
import 'package:communication/screens/other_screens/launch_screen.dart';
import 'package:communication/screens/request_screens/request_details_screen.dart';
import 'package:communication/screens/request_screens/request%20_empty_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/book_screen.dart';
import 'package:communication/screens/tabbar_screen/learn_screens/course_screen.dart';
import 'package:communication/screens/user_profile_screens/translator_profile_screen.dart';
import 'package:communication/screens/user_profile_screens/user_profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefController().initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () =>
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,     //04
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale('ar'),
            initialRoute: '/launch_screen',
            routes: {
              // '/all_widget' : (context) => AllWidget(),
              '/launch_screen' : (context) => LaunchScreen(),
              '/home_screen' : (context) => HomeScreen(),
              '/learn_screen' : (context) => LearnScreen(),
              '/book_screen' : (context) => BookScreen(),
              '/course_screen' : (context) => CourseScreen(),
              '/request_empty_screen' : (context) => RequestEmptyScreen(),
              '/job_screen' : (context) => JobScreen(),
              '/request_screen' : (context) => RequestScreen(),
              '/settings_screen' : (context) => SettingsScreen(),
              '/request_details_screen' : (context) => RequestDetailsScreen(),
              '/evaluation_person_screen' : (context) => EvaluationPersonScreen(),
              '/user_profile_screen' : (context) => UserProfileScreen(),
              '/edit_profile_user_screen' : (context) => EditProfileUserScreen(),
              '/about_us_screen' : (context) => AboutUsScreen(),
              '/privacy_policy_screen' : (context) => PrivacyPolicyScreen(),
              '/terms_conditions_screen' : (context) => TermsConditionsScreen(),
              '/help_faqs_screen' : (context) => HelpFaqsScreen(),
              '/add_request_screen' : (context) => AddRequestScreen(),
              '/login_screen' : (context) => LoginScreen(),
              '/recovery_account_screen' : (context) => RecoveryAccountScreen(),
              // '/add_code_screen' : (context) => AddCodeScreen(),
              '/create_account_screen' : (context) => CreateAccountScreen(),
              '/empty_nafication_screen' : (context) => EmptyNaficationScreen(),
              '/nafication_screen' : (context) => NaficationScreen(),
              '/thank_you_screen' : (context) => ThankYouScreen(),
              '/no_connection_screen' : (context) => NoConnectionScreen(),
              '/success_send_screen' : (context) => SuccessSendScreen(),
              '/request_details_translator_screen' : (context) => RequestDetailsTranslatorScreen(),
              '/home_translator_screen' : (context) => HomeTranslatorScreen(),
              '/blog_info_screen' : (context) => BlogInfoScreen(),
              '/translator_profile_screen' : (context) => TranslatorProfileScreen(),
              '/my_evaluation_screen' : (context) => MyEvaluationScreen(),
              '/job_info_screen' : (context) => JobInfoScreen(),
              '/course_info_screen' : (context) => CourseInfoScreen(),
              '/onboarding_first_screen' : (context) => OnBoardingFirstScreen(),
              '/onboarding_second_screen' : (context) => OnBoardingSecondScreen(),
              '/onboarding_third_screen' : (context) => OnBoardingThirdScreen(),
              '/main_screen' : (context) => MainScreen(),
              '/main_translator_screen' : (context) => MainTranslatorScreen(),
              '/map_screen' : (context) => MapScreen(),
            },
            //... other code
            builder: (context, widget) {
              //add this line
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            theme: ThemeData(
              textTheme: TextTheme(
                //To support the following, you need to use the first initialization method
                  button: TextStyle(fontSize: 45.sp)
              ),
            ),
          ),
    );
  }
}
