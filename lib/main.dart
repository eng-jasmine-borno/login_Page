import 'package:flutter/material.dart';
import 'package:flutter_app_login/widgets.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return Directionality(textDirection: TextDirection.rtl,child:
         Builder(
            builder: (BuildContext context) {
              return ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context,widget!),
                maxWidth: 1200,
                minWidth: 450,
                defaultScale: true,
                breakpoints: [
                  ResponsiveBreakpoint.resize(450, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
              );
            })
        );},
      title: 'Login Page ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = true;
  bool isChecked = false;
  bool isRemember = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor:Color(0XFFFFFFFFF),centerTitle: true,
          title: const Text('تسجيل الدخول',
            style: TextStyle(color: Color(0XFFF303030), fontSize: 18,),),),

        body:SingleChildScrollView(
              child: Container(margin: EdgeInsets.all(15),padding:EdgeInsets.all(10) ,
                  child:Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50,),
                            FlutterLogo(size: 90,),
                            SizedBox(height:60,),
                            Form(
                              child: Column(  mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFunctions.user(email, icon:Icon(Icons.email_outlined),
                                      label: "البريد الاإلكتروني",obscure: false,colors: Color(0XFF156CF3),),
                                  TextFunctions.user(password,
                                      icon: GestureDetector(
                                        onTap: () => setState(() => showPassword = !showPassword),
                                        child: Icon(showPassword ? Icons.visibility : Icons.visibility_off,),
                                      ),
                                      obscure: !showPassword,
                                      label: "كلمة المرور",colors: Color(0XFF156CF3)),
                                  Padding(padding: const EdgeInsets.only(right:250),
                                    child: TextButton(
                                        child: Text('نسيت كلمة المرور !',
                                            style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold)),
                                        onPressed: (){})
                                    , ),

                                  TextFunctions.rememberMe(
                                      title: "تذكير كلمة المرور",
                                      context: context, isCheck: isRemember, press: (bool? v) { isRemember = v!;},
                                  ),
                                  TextFunctions.agreeToConditin(isCheck: isChecked, press: (bool? v ) { isChecked=v!; }, ),
                                  SizedBox(height:30,),
                                  Container(height: 100,
                                      child:PrimaryButton(text:"تسجيل الدخول",color: Color(0XFF1DB1FF),
                                            onPressed:(){}, )),
                                  SizedBox(height: 20,),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [const Text('ليس لديك حساب؟ ',style: TextStyle(
                                        fontSize: 14)),
                                      TextButton(
                                          child:const Text('إنشاء حساب',style: TextStyle(
                                              color:Color(0XFF1DB1FF),fontSize: 14)),
                                          onPressed:(){}
                                      )],),],),)
                          ])))

          ));
  }
}
