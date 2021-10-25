import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';
import '../widgets/spend_textfield.dart';

class AddProfilPage extends StatefulWidget {
  const AddProfilPage({Key? key}) : super(key: key);

  @override
  State<AddProfilPage> createState() => _AddProfilPageState();
}

class _AddProfilPageState extends State<AddProfilPage> {
  final _controller = Get.put(AppController());

  @override
  void initState() {
    _controller.startTimer();
    _controller.isActivBtn.value = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
        centerTitle: true,
        actions: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                    child: Text(
                  _controller.timerTxt,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              )),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _controller.nameCtrl,
              label: 'Name',
              textType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _controller.addressCtrl,
              label: 'Address',
              textType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _controller.dateCtrl,
              label: 'Date of Birth',
              icon: Icons.calendar_today,
              isRead: true,
              onTap: () => _controller.selectDate(context),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _controller.heightCtrl,
              label: 'Height',
              textType: TextInputType.number,
              sufixText: 'Cm',
              isText: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _controller.weightCtrl,
              label: 'Weight',
              textType: TextInputType.number,
              sufixText: 'Kg',
              isText: true,
              // inputFormatter: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                GetBuilder<AppController>(
                  builder: (_) {
                    return SizedBox(
                      height: 150,
                      width: 150,
                      child: (_controller.imageGalery != null)
                          ? Image.file(
                              _controller.imageGalery,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/foto.png',
                              fit: BoxFit.cover,
                            ),
                    );
                  },
                ),
                Flexible(
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8),
                      )),
                      onPressed: () => _controller.pickImageGalery(),
                      child: const Text(
                        'Pick Image',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 34),
            Obx(() => ElevatedButton(
                  onPressed: () => (_controller.isActivBtn.value)
                      ? _controller.addData()
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: (_controller.isActivBtn.value)
                        ? Colors.blue
                        : Colors.grey,
                    minimumSize: Size(size.width, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Save Data',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
