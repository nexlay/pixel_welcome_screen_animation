import 'package:flutter/material.dart';
import 'package:pixelnex/widgets/custom_android_13_logo.dart';
import 'package:pixelnex/widgets/custom_oval.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 6),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.1, -0.45),
    end: const Offset(0.1, -0.28),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.0,
        1,
        curve: Curves.elasticIn,
      ),
    ),
  );
  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin: const Offset(0.1, -0.4),
    end: const Offset(0.3, -0.15),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.8,
        1.0,
        curve: Curves.easeInCirc,
      ),
    ),
  );
  late final Animation<Offset> _offsetAnimation3 = Tween<Offset>(
    begin: const Offset(-0.2, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.0,
        1.0,
        curve: Curves.easeIn,
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        runSpacing: 200.0,
        children: [
          SlideTransition(
            position: _offsetAnimation3,
            child: SlideTransition(
              position: _offsetAnimation,
              child: Center(
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.height / 3,
                      MediaQuery.of(context).size.width / 1.5),
                  painter: CANLPainter(),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 250,
                right: 100,
                child: SlideTransition(
                  position: _offsetAnimation2,
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.height / 8,
                        MediaQuery.of(context).size.width / 4),
                    painter: COval(),
                  ),
                ),
              ),
              Wrap(
                runSpacing: 15.0,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.0),
                    child: Text(
                      'Welcome to your Pixel',
                      style: TextStyle(fontSize: 54.0),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.language,
                        size: 24.0,
                        color: Colors.green,
                      ),
                      title: Text(
                        'English(United States)',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.accessibility,
                        color: Colors.green,
                      ),
                      title: const Text('Assistive options'),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Emergency call',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(26.0),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_controller.isCompleted) {
                              _controller.reverse();
                            } else {
                              _controller.forward();
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text('Get Started'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 0.0),
        ],
      ),
    );
  }
}
