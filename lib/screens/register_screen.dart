import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _userType = 'Select User Type';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepperIndicator(),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _userType,
              items: <String>['Select User Type', 'User Type 1', 'User Type 2']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _userType = newValue!;
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle next button press
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // full width
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepperIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.green,
              child: Text('1', style: TextStyle(color: Colors.white)),
            ),
            Text('Register', style: TextStyle(color: Colors.green)),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Divider(color: Colors.grey, thickness: 2),
        ),
        SizedBox(width: 10),
        Column(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              child: Text('2', style: TextStyle(color: Colors.white)),
            ),
            Text('Complete Data', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
