import 'package:flutter/material.dart';

void main() {
  runApp(const SmartAssetApp());
}

class SmartAssetApp extends StatelessWidget {
  const SmartAssetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asset & Student Manager',
      theme: ThemeData(
        // Përdorimi i një teme të pastër me ngjyra neutrale
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          primary: const Color(0xFF212529),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212529)),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF495057)),
        ),
      ),
      home: const MainItemScreen(),
    );
  }
}

class MainItemScreen extends StatefulWidget {
  const MainItemScreen({super.key});

  @override
  State<MainItemScreen> createState() => _MainItemScreenState();
}

class _MainItemScreenState extends State<MainItemScreen> {
  // GlobalKey për formën dhe controller-at për ruajtjen e inputit
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  // Lista dinamike e të dhënave (Studentë ose Produkte)
  final List<Map<String, String>> _itemList = [
    {'emri': 'Studenti i Parë', 'email': 'student1@uni-pr.edu'},
    {'emri': 'Studenti i Dytë', 'email': 'student2@uni-pr.edu'},
  ];

  // Funksioni për shtimin e elementit të ri pas validimit
  void _addItem() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _itemList.add({
          'emri': _nameController.text.trim(),
          'email': _emailController.text.trim(),
        });
      });

      // Pastrimi i fushave pas ruajtjes
      _nameController.clear();
      _emailController.clear();

      // Shfaqja e një mesazhi konfirmues të thjeshtë
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('U shtua me sukses!'), backgroundColor: Colors.green),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Përdorimi i LayoutBuilder ose MediaQuery për ta bërë layout-in më responsive
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menaxhimi i Studentëve / Produkteve'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF212529),
        elevation: 0, // Pa hije të tepërta
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildFormCard()),
                    const SizedBox(width: 20),
                    Expanded(flex: 3, child: _buildItemList()),
                  ],
                )
              : Column(
                  children: [
                    _buildFormCard(),
                    const SizedBox(height: 20),
                    Expanded(child: _buildItemList()),
                  ],
                ),
        ),
      ),
    );
  }

  // Widget-i i Formës
  Widget _buildFormCard() {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Shto një rekord të ri',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),

              // Inputi për Emrin
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Emri i plotë',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ju lutem shkruani emrin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Inputi për Email-in me validim specifik
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Adresa',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ju lutem shkruani email-in';
                  }
                  // Validim i thjeshtë me Regex për email
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Ju lutem shkruani një email valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Butoni i thjeshtë për Ruajtje
              ElevatedButton(
                onPressed: _addItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF212529),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: const Text('Ruaj të dhënat'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget-i i Listës dinamike
  Widget _buildItemList() {
    if (_itemList.isEmpty) {
      return const Center(child: Text('Nuk ka asnjë të dhënë të regjistruar.'));
    }

    return ListView.builder(
      itemCount: _itemList.length,
      itemBuilder: (context, index) {
        final item = _itemList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          color: Colors.white,
          elevation: 0.5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.blueGrey),
            title: Text(item['emri'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(item['email'] ?? ''),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () {
                setState(() {
                  _itemList.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }
}
