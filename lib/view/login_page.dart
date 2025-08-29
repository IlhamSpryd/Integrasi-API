import 'package:flutter/material.dart';
import 'package:gallery_apps/model/register.dart';
import 'package:gallery_apps/preferences/shared_preferences.dart';
import 'package:gallery_apps/services/authentication_api.dart';
import 'package:gallery_apps/view/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const id = "/Login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  RegisterUserModel? user;
  String? errorMessage;
  bool isVisibility = false;

  Future<void> _login() async {
    setState(() => isLoading = true);
    try {
      final user = await AuthenticationAPI.loginUser(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // simpan token & status login
      PreferenceHandler.saveToken(user.data?.token.toString() ?? "");
      PreferenceHandler.saveLogin();

      print(user.toJson());

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, DashboardPage.id);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Scaffold ditambahkan
      body: Stack(
        children: [
          buildBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login", // ✅ ubah dari "Register"
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// EMAIL
                      buildTitle("Email"),
                      const SizedBox(height: 10),
                      buildTextField(
                        hintText: "Enter your email",
                        controller: _emailController,
                      ),
                      const SizedBox(height: 20),

                      /// PASSWORD
                      buildTitle("Password"),
                      const SizedBox(height: 10),
                      buildTextField(
                        hintText: "Enter your password",
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 20),

                      /// FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// BUTTON LOGIN
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login", // ✅ ubah dari "Daftar"
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/Register");
                        },
                        child: const Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ------------------- BACKGROUND -------------------
  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(color: Colors.black.withOpacity(0.5)),
    );
  }

  /// ------------------- TEXT FIELD -------------------
  TextField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword
          ? !isVisibility // ✅ fix: default hidden
          : false,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() => isVisibility = !isVisibility);
                },
                icon: Icon(
                  isVisibility ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }

  Widget buildTitle(String text) {
    return Row(
      children: [
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.white70)),
      ],
    );
  }
}
