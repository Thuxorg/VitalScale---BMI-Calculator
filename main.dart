import 'package:flutter/material.dart';

void main() {
  runApp(const VitalScaleApp());
}

class VitalScaleApp extends StatelessWidget {
  const VitalScaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VitalScale',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF006B5C),
          onPrimary: Colors.white,
          primaryContainer: Color(0xFF00BFA5),
          surface: Color(0xFFF8F9FA),
          onSurface: Color(0xFF191C1D),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ============ COLORS ============
class AppColors {
  static const Color primary = Color(0xFF006B5C);
  static const Color onPrimary = Colors.white;
  static const Color primaryContainer = Color(0xFF00BFA5);
  static const Color surface = Color(0xFFF8F9FA);
  static const Color onSurface = Color(0xFF191C1D);
  static const Color surfaceContainer = Color(0xFFEDEEEF);

  static const Color underweight = Color(0xFF42A5F5);
  static const Color normal = Color(0xFF66BB6A);
  static const Color overweight = Color(0xFFFFA726);
  static const Color obese = Color(0xFFEF5350);
  static const Color obeseSevere = Color(0xFFC62828);
}

// ============ BMI MODEL ============
class BMIResult {
  final double bmi;
  final String category;
  final String status;
  final Color color;

  BMIResult({
    required this.bmi,
    required this.category,
    required this.status,
    required this.color,
  });

  factory BMIResult.calculate({
    required double height,
    required double weight,
    required int age,
    required String gender,
    bool isMetric = true,
  }) {
    double heightInMeters = isMetric ? height / 100 : height * 0.0254;
    double weightInKg = isMetric ? weight : weight * 0.453592;
    double bmi = weightInKg / (heightInMeters * heightInMeters);
    bmi = double.parse(bmi.toStringAsFixed(1));

    String category;
    String status;
    Color color;

    if (bmi < 16.0) {
      category = 'Severe Underweight';
      status = 'Severe Thinness';
      color = AppColors.underweight;
    } else if (bmi < 18.5) {
      category = 'Underweight';
      status = 'Mild Thinness';
      color = AppColors.underweight;
    } else if (bmi < 25.0) {
      category = 'Normal';
      status = 'Healthy Weight';
      color = AppColors.normal;
    } else if (bmi < 30.0) {
      category = 'Overweight';
      status = 'Overweight';
      color = AppColors.overweight;
    } else if (bmi < 35.0) {
      category = 'Obese Class I';
      status = 'Moderate Obesity';
      color = AppColors.obese;
    } else if (bmi < 40.0) {
      category = 'Obese Class II';
      status = 'Severe Obesity';
      color = AppColors.obese;
    } else {
      category = 'Obese Class III';
      status = 'Very Severe Obesity';
      color = AppColors.obeseSevere;
    }

    return BMIResult(
      bmi: bmi,
      category: category,
      status: status,
      color: color,
    );
  }

  List<String> getRecommendations() {
    if (bmi < 18.5) {
      return [
        'Eat nutrient-dense foods with healthy fats',
        'Strength train 2-3 times per week',
        'Add protein to every meal',
      ];
    } else if (bmi < 25.0) {
      return [
        'Maintain balanced diet with variety',
        'Exercise 150 minutes per week',
        'Stay hydrated throughout the day',
      ];
    } else if (bmi < 30.0) {
      return [
        'Reduce portion sizes gradually',
        'Increase daily physical activity',
        'Choose whole foods over processed',
      ];
    } else {
      return [
        'Consult healthcare professional',
        'Start with low-impact exercises',
        'Focus on gradual lifestyle changes',
      ];
    }
  }
}

// ============ WELCOME SCREEN ============
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              AppColors.primary,
              Color(0xFF005245),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 30,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.monitor_heart,
                    size: 50,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'VitalScale',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xE6FFFFFF),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0x26FFFFFF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Track your body metrics with clinical precision',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Calculate your BMI and get personalized health insights',
                        style: TextStyle(
                          color: Color(0xCCFFFFFF),
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CalculatorScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Track your health journey',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0x99FFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============ CALCULATOR SCREEN ============
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // All state variables
  String selectedGender = 'Male';
  double height = 170;
  double weight = 70;
  int age = 25;
  bool isMetric = true;
  bool isCalculating = false;
  BMIResult? currentResult;

  double get estimatedBMI {
    try {
      return BMIResult.calculate(
        height: height,
        weight: weight,
        age: age,
        gender: selectedGender,
        isMetric: isMetric,
      ).bmi;
    } catch (e) {
      return 0.0;
    }
  }

  // Methods
  void setGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void setHeight(double value) {
    setState(() {
      height = value;
    });
  }

  void incrementWeight() {
    setState(() {
      weight = isMetric ? weight + 1 : weight + 0.5;
    });
  }

  void decrementWeight() {
    setState(() {
      weight = isMetric ? weight - 1 : weight - 0.5;
      if (weight < (isMetric ? 20 : 44)) weight = isMetric ? 20 : 44;
    });
  }

  void incrementAge() {
    setState(() {
      if (age < 120) {
        age++;
      }
    });
  }

  void decrementAge() {
    setState(() {
      if (age > 1) {
        age--;
      }
    });
  }

  void toggleUnits() {
    setState(() {
      isMetric = !isMetric;
      if (!isMetric) {
        height = (height / 2.54).roundToDouble();
        weight = (weight / 0.453592).roundToDouble();
      } else {
        height = (height * 2.54).roundToDouble();
        weight = (weight * 0.453592).roundToDouble();
      }
    });
  }

  void calculateBMI() {
    setState(() {
      isCalculating = true;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      final result = BMIResult.calculate(
        height: height,
        weight: weight,
        age: age,
        gender: selectedGender,
        isMetric: isMetric,
      );

      setState(() {
        isCalculating = false;
        currentResult = result;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(result: result),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track your body metrics with clinical precision',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),

            // Gender Selection
            Row(
              children: [
                Expanded(
                  child: _buildGenderCard(
                      'Male', Icons.male, selectedGender == 'Male'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildGenderCard(
                      'Female', Icons.female, selectedGender == 'Female'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Height Slider
            _buildHeightSlider(),

            const SizedBox(height: 16),

            // Weight & Age
            Row(
              children: [
                Expanded(child: _buildWeightController()),
                const SizedBox(width: 12),
                Expanded(child: _buildAgeController()),
              ],
            ),

            const SizedBox(height: 16),

            // Unit Toggle
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildUnitToggle('Metric', true),
                  _buildUnitToggle('Imperial', false),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Live BMI Preview
            if (estimatedBMI > 0) ...[
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Estimated BMI',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          estimatedBMI.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 5),
                      decoration: BoxDecoration(
                        color: _getBMIColor(estimatedBMI),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        _getBMICategory(estimatedBMI),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Calculate Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isCalculating ? null : calculateBMI,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isCalculating
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Calculate BMI',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderCard(String gender, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () => setGender(gender),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.12)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 28,
              color: isSelected ? AppColors.primary : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              gender,
              style: TextStyle(
                color: isSelected ? AppColors.primary : Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeightSlider() {
    final minHeight = isMetric ? 100.0 : 39.0;
    final maxHeight = isMetric ? 250.0 : 98.0;
    final displayValue = isMetric ? height : (height / 2.54).round();
    final unit = isMetric ? 'cm' : 'in';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Height',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Text(
                      displayValue.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      unit,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Slider(
            value: height,
            min: minHeight,
            max: maxHeight,
            divisions: (maxHeight - minHeight).round(),
            activeColor: AppColors.primary,
            inactiveColor: Colors.grey[300],
            onChanged: setHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                minHeight.round().toString(),
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
              Text(
                maxHeight.round().toString(),
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeightController() {
    final unit = isMetric ? 'kg' : 'lb';
    final displayValue = isMetric ? weight : (weight * 2.20462).round();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weight',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildControlButton(Icons.remove, decrementWeight),
              const SizedBox(width: 12),
              Column(
                children: [
                  Text(
                    displayValue.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              _buildControlButton(Icons.add, incrementWeight),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAgeController() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Age',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildControlButton(Icons.remove, decrementAge),
              const SizedBox(width: 12),
              Column(
                children: [
                  Text(
                    age.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    'yrs',
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              _buildControlButton(Icons.add, incrementAge),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onPressed) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.grey[200],
      child: IconButton(
        icon: Icon(icon, size: 18),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildUnitToggle(String label, bool isMetricValue) {
    final isSelected = isMetric == isMetricValue;

    return GestureDetector(
      onTap: isSelected ? null : toggleUnits,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: isMetricValue ? const Radius.circular(6) : Radius.zero,
            bottomLeft: isMetricValue ? const Radius.circular(6) : Radius.zero,
            topRight: !isMetricValue ? const Radius.circular(6) : Radius.zero,
            bottomRight:
                !isMetricValue ? const Radius.circular(6) : Radius.zero,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25.0) return 'Normal';
    if (bmi < 30.0) return 'Overweight';
    return 'Obese';
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) return AppColors.underweight;
    if (bmi < 25.0) return AppColors.normal;
    if (bmi < 30.0) return AppColors.overweight;
    return AppColors.obese;
  }
}

// ============ RESULT SCREEN ============
class ResultScreen extends StatelessWidget {
  final BMIResult result;

  const ResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Result'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildBMIDisplay(context),
            const SizedBox(height: 20),
            _buildHealthStatus(context),
            const SizedBox(height: 20),
            _buildRecommendations(context),
            const SizedBox(height: 20),
            _buildActionButtons(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBMIDisplay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            result.color,
            result.color.withValues(alpha: 0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: result.color.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'YOUR BODY MASS INDEX',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 130,
                width: 130,
                child: CircularProgressIndicator(
                  value: result.bmi / 40,
                  strokeWidth: 10,
                  backgroundColor: Colors.white.withValues(alpha: 0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              Column(
                children: [
                  Text(
                    result.bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'kg/m²',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              result.category.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Healthy BMI Range: 18.5 – 24.9',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthStatus(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: result.color,
                  size: 20,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Health Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              result.status,
              style: TextStyle(
                fontSize: 15,
                color: result.color,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _getHealthAdvice(result.category),
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendations(BuildContext context) {
    final recommendations = result.getRecommendations();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recommendations',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...recommendations.map((rec) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: AppColors.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          rec,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Recalculate',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share feature coming soon!')),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.share, size: 18),
                const SizedBox(width: 6),
                Text(
                  'Share',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getHealthAdvice(String category) {
    switch (category) {
      case 'Severe Underweight':
      case 'Underweight':
        return 'Consider consulting a healthcare professional for guidance on healthy weight gain.';
      case 'Normal':
        return 'Continue maintaining your healthy lifestyle with balanced nutrition and regular exercise.';
      case 'Overweight':
        return 'Focus on increasing physical activity and making mindful food choices.';
      default:
        return 'Consult with a healthcare provider for a comprehensive health assessment.';
    }
  }
}
