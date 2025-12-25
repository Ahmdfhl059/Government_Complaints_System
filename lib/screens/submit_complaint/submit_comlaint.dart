import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_complaints_system/data/api/complaint_api.dart';
import 'package:government_complaints_system/data/api/complaint_type_api.dart';
import 'package:government_complaints_system/data/models/cities.dart';
import 'package:government_complaints_system/data/models/state.dart';
import 'package:government_complaints_system/data/repo/complaint_repo.dart';
import 'package:government_complaints_system/data/repo/complaint_type_repo.dart';
import 'package:government_complaints_system/logic/cities_cubit/cities_cubit.dart';
import 'package:government_complaints_system/logic/complaint_cubit/complaint_cubit.dart';
import 'package:government_complaints_system/logic/complaint_type_cubit/complaint_type_cubit.dart';
import 'package:government_complaints_system/logic/state_cubit/state_cubit.dart';
import 'package:government_complaints_system/screens/submit_complaint/show_Image_picker_sheet.dart';
import 'package:government_complaints_system/shared/components/components.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/api/cities_api.dart';
import '../../data/api/state_api.dart';
import '../../data/models/complaint_type.dart';
import '../../data/repo/cities_repo.dart';
import '../../data/repo/state_repo.dart';
import '../../utils/constants.dart';

class SubmitComlaint extends StatefulWidget {
  final int agency;

  const SubmitComlaint({super.key, required this.agency});

  @override
  State<SubmitComlaint> createState() => _SubmitComlaintState();
}

class _SubmitComlaintState extends State<SubmitComlaint> {
  List<XFile> images = [];

  void pickImages(BuildContext context) async {
    final result = await showImagePickerSheet(context);

    if (result == null) return;

    setState(() {
      if (result is XFile) {
        images.add(result);
      } else if (result is List<XFile>) {
        images.addAll(result);
      }
    });

    print("عدد الصور: ${images.length}");
  }

  @override
  Widget build(BuildContext context) {
    var descriptionController = TextEditingController();
    int? complaintTypeId;
    int? agencyId;
    int? stateId;
    int? cityId;
    String? stateName;
    String? cityName;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: defaultColor,
        title: Text(
          'تقديم شكوى',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        leading: DefaultIconButton(
          onPressed: () {
            navigatePop(context, true);
          },
          icon: Icon(Icons.arrow_back_outlined),
          size: 30,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => ComplaintTypeCubit(
                  complaintTypeRepo: ComplaintTypeRepo(
                    complaintTypeApi: ComplaintTypeApi(),
                  ),
                ),
                child: BlocBuilder<ComplaintTypeCubit, ComplaintTypeState>(
                  builder: (context, state) {
                    return DefDropdownButton<ComplaintType>(
                      hintText: 'نوع الشكوى',
                      items: state.complaintsType,
                      itemAsString: (ct) => ct.name,
                      onChanged: (value) {
                        complaintTypeId = value?.id;
                        print('تم اختيار نوع الشكوى: ${value?.name}');
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              BlocProvider(
                create: (context) =>
                    StateCubit(stateRepo: StateRepo(stateApi: StateApi())),
                child: BlocBuilder<StateCubit, StateState>(
                  builder: (context, state) {
                    return DefDropdownButton<StateModel>(
                      hintText: 'اختر المحافظة',
                      items: state.states,
                      itemAsString: (ct) => ct.name,
                      onChanged: (value) {
                        stateId = value?.id;
                        stateName = value?.name;
                        print('تم اختيار المحافظة: ${value?.name}');
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              BlocProvider(
                create: (context) =>
                    CitiesCubit(citiesRepo: CitiesRepo(citiesApi: CitiesApi())),
                child: BlocBuilder<CitiesCubit, CitiesState>(
                  builder: (context, state) {
                    return DefDropdownButton<Cities>(
                      hintText: 'اختر الحي',
                      items: state.cities,
                      itemAsString: (ct) => ct.name,
                      onChanged: (value) {
                        cityId = value?.id;
                        cityName = value?.name;
                        print('تم اختيار الحي: ${value?.name}');
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'اضف وصف',
                    style: TextStyle(
                      color: secondaryColor.withValues(alpha: 0.6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: defaultColor),
                  ),
                  alignLabelWithHint: true,
                ),
                cursorColor: defaultColor,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 15),
              DefaultButton(
                background: defaultColor,
                text: 'إضافة صور',
                onPress: () {
                  pickImages(context);
                },
              ),
              SizedBox(height: 20),

              ImagesPreview(
                images: images,
                onDelete: (index) {
                  setState(() {
                    images.removeAt(index);
                  });
                },
              ),
              SizedBox(height: 150,),
              BlocProvider(
                create: (context) => ComplaintCubit(
                  complaintRepo: ComplaintRepo(complaintApi: ComplaintApi()),
                ),
                child: BlocBuilder<ComplaintCubit, ComplaintState>(
                  builder: (context, state) {
                    if (state.status == ComplaintStatus.error) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.error.isEmpty
                              ? 'Error loading courses'
                              : state.error,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      );
                    }
                    return DefaultButton(
                      background: defaultColor,
                      text: 'تـــــم',
                      onPress: () {
                        context.read<ComplaintCubit>().registerComplaint(
                          complaintTypeId: complaintTypeId,
                          agencyId: agencyId,
                          description: descriptionController.text,
                          location: '$stateName-$cityName',
                          documents: images,
                          stateId: stateId,
                          cityId: cityId,
                          countryId: null,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
