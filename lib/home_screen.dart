import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _counter = 0;
  Color _backgroundColor = Colors.blue.shade100;
  double _borderRadius = 20.0;
  double _containerSize = 200.0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  // List of emojis based on counter value
  final List<String> _moods = [
    '😴', // 0-4: Sleeping
    '😐', // 5-9: Neutral
    '🙂', // 10-14: Slight smile
    '😊', // 15-19: Happy
    '😄', // 20-24: Very happy
    '😁', // 25-29: Grinning
    '🤩', // 30-34: Star-struck
    '🥳', // 35-39: Party
    '🚀', // 40+: Rocket!
  ];

  // List of motivational quotes
  final List<String> _quotes = [
    'Just getting started!',
    'Keep going!',
    'You are doing great!',
    'Awesome progress!',
    'Unstoppable!',
    'On fire! 🔥',
    'Amazing energy!',
    'To the moon! 🌙',
    'LEGENDARY! ⭐',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _updateUI();
    });
    _animationController.forward().then((_) => _animationController.reverse());
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _updateUI();
      }
    });
    _animationController.forward().then((_) => _animationController.reverse());
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _updateUI();
    });
  }

  void _updateUI() {
    // Random background color
    _backgroundColor = Color.fromRGBO(
      Random().nextInt(200) + 55,
      Random().nextInt(200) + 55,
      Random().nextInt(200) + 55,
      1.0,
    );

    // Change border radius based on counter (cycles through shapes)
    int shapeType = (_counter ~/ 5) % 4;
    switch (shapeType) {
      case 0:
        _borderRadius = 20.0; // Rounded square
        break;
      case 1:
        _borderRadius = 100.0; // Circle
        break;
      case 2:
        _borderRadius = 50.0; // More rounded
        break;
      case 3:
        _borderRadius = 0.0; // Sharp square
        break;
    }

    // Container size grows with counter (but caps at a max)
    _containerSize = 200.0 + (_counter * 2).clamp(0, 100);
  }

  String _getCurrentEmoji() {
    int index = (_counter ~/ 5).clamp(0, _moods.length - 1);
    return _moods[index];
  }

  String _getCurrentQuote() {
    int index = (_counter ~/ 5).clamp(0, _quotes.length - 1);
    return _quotes[index];
  }

  double _getEmojiFontSize() {
    return 60.0 + (_counter * 0.5).clamp(0, 40);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Evolution Counter'),
        centerTitle: true,
        backgroundColor: _backgroundColor,
        elevation: 0,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: _backgroundColor.withOpacity(0.3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated mood container
              ScaleTransition(
                scale: _scaleAnimation,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  width: _containerSize,
                  height: _containerSize,
                  decoration: BoxDecoration(
                    color: _backgroundColor,
                    borderRadius: BorderRadius.circular(_borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          fontSize: _getEmojiFontSize(),
                        ),
                        child: Text(_getCurrentEmoji()),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '$_counter',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Motivational quote
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    _getCurrentQuote(),
                    key: ValueKey<int>(_counter ~/ 5),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: _backgroundColor.computeLuminance() > 0.5
                          ? Colors.black87
                          : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Control buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrease',
                    backgroundColor: Colors.red.shade400,
                    heroTag: 'decrease',
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: _resetCounter,
                    tooltip: 'Reset',
                    backgroundColor: Colors.grey.shade600,
                    heroTag: 'reset',
                    child: const Icon(Icons.refresh),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increase',
                    backgroundColor: Colors.green.shade400,
                    heroTag: 'increase',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Info text
              Text(
                'Tap + to evolve your mood!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}