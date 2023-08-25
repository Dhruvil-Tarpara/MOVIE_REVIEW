import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/global.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/constant/widgets/bottom_sheet.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/constant/widgets/text_form_field.dart';
import 'package:movie_review/src/provider/bloc/bloc/opration_bloc.dart';
import 'package:movie_review/src/provider/bloc/data/movie_data_bloc.dart';
import 'package:movie_review/src/provider/firebase/firestore/firebase_cloud.dart';
import 'package:movie_review/src/provider/firebase/firestore/movie_model.dart';
import 'package:movie_review/src/utils/extension/uuid.dart';
import 'package:movie_review/src/utils/media_query.dart';
import 'package:movie_review/src/views/login/button.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({super.key});

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final ValueNotifier<AutovalidateMode> _valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  final GlobalKey<FormState> _movieKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _prodactionController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  String? image;
  String uuid = idGenerator();

  @override
  void initState() {
    super.initState();
    _valueNotifier.value = AutovalidateMode.disabled;
    uuid = idGenerator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context
                .read<MovieDataBloc>()
                .add(const MovieDataEvent.refreshData());
            FirebaseCloudHelper.firebaseCloudHelper.deleteImage(key: uuid);
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ConstColor.primary1,
          ),
        ),
      ),
      backgroundColor: ConstColor.white,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder: (context, value, child) => Form(
            key: _movieKey,
            autovalidateMode: value,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: height(context: context) * 0.02,
                  ),
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: ConstColor.primary2,
                    child: (image != null)
                        ? CircleAvatar(
                            radius: 58,
                            backgroundImage: NetworkImage(image!),
                          )
                        : const CircleAvatar(
                            radius: 58,
                            backgroundImage: AssetImage(Global.uploadImage),
                          ),
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return FxBottomSheet(
                            onPressedCamera: () async {
                              image = await FirebaseCloudHelper
                                  .firebaseCloudHelper
                                  .uplodeImage(
                                file:
                                    await getImage(source: ImageSource.camera),
                                key: uuid,
                              );
                              if (image == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: FxText(
                                      text: ConstString.errorMassage,
                                      color: Colors.red,
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.white,
                                  ),
                                );
                              }
                            },
                            onPressedGallery: () async {
                              image = await FirebaseCloudHelper
                                  .firebaseCloudHelper
                                  .uplodeImage(
                                      file: await getImage(
                                          source: ImageSource.gallery),
                                      key: uuid);

                              if (image == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: FxText(
                                      text: ConstString.errorMassage,
                                      color: Colors.red,
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.white,
                                  ),
                                );
                              }
                            },
                          );
                        },
                      );
                    },
                    child: FxText(
                      text: ConstString.movieImage,
                      color: ConstColor.primary1,
                    ),
                  ),
                  SizedBox(
                    height: height(context: context) * 0.06,
                  ),
                  FxTextFormField(
                    controller: _nameController,
                    textInputType: TextInputType.text,
                    labelText: FxText(
                      text: ConstString.movieName,
                      color: ConstColor.black,
                      size: 14,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ConstString.movieNameError;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height(context: context) * 0.04,
                  ),
                  FxTextFormField(
                    controller: _categoryController,
                    textInputType: TextInputType.text,
                    labelText: FxText(
                      text: ConstString.category,
                      color: ConstColor.black,
                      size: 14,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ConstString.categoryError;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height(context: context) * 0.04,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FxTextFormField(
                          controller: _dateController,
                          onTap: () async {
                            final DateTime? result = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100),
                            );
                            if (result != null) {
                              String formattedDate =
                                  DateFormat(ConstString.dateFormat)
                                      .format(result);
                              _dateController.text = formattedDate;
                            }
                          },
                          prefix: Icon(
                            Icons.date_range,
                            color: ConstColor.primary1,
                          ),
                          readOnly: true,
                          labelText: FxText(
                            text: ConstString.releaseDate,
                            color: ConstColor.black,
                            size: 14,
                          ),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ConstString.releaseDateError;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: width(context: context) * 0.02,
                      ),
                      Expanded(
                        child: FxTextFormField(
                          controller: _timeController,
                          readOnly: true,
                          onTap: () async {
                            if (_dateController.text.isNotEmpty) {
                              final TimeOfDay? result = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (result != null) {
                                _timeController.text = result.format(context);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: FxText(
                                    text: ConstString.releaseDateError,
                                    color: Colors.red,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.white,
                                ),
                              );
                            }
                          },
                          prefix: Icon(
                            Icons.access_time_filled,
                            color: ConstColor.primary1,
                          ),
                          textInputType: TextInputType.text,
                          labelText: FxText(
                            text: ConstString.releaseTime,
                            color: ConstColor.black,
                            size: 14,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ConstString.releaseTimeError;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(context: context) * 0.04,
                  ),
                  FxTextFormField(
                    controller: _prodactionController,
                    textInputType: TextInputType.text,
                    labelText: FxText(
                      text: ConstString.prodaction,
                      color: ConstColor.black,
                      size: 14,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ConstString.prodactionError;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height(context: context) * 0.04,
                  ),
                  FxTextFormField(
                    controller: _descriptionController,
                    textInputType: TextInputType.text,
                    maxLine: 4,
                    labelText: FxText(
                      text: ConstString.description,
                      color: ConstColor.black,
                      size: 14,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ConstString.descriptionError;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height(context: context) * 0.04,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocListener<OprationBloc, OprationState>(
        listener: (context, state) {
          state.whenOrNull(
              fialed: (value) => (value)
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: FxText(text: ConstString.errorMassage),
                      ),
                    )
                  : Navigator.pop(context));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: SizedBox(
            height: height(context: context) * 0.068,
            child: FxButton(
              buttonText: ConstString.addMovie,
              onPressed: () {
                _valueNotifier.value = AutovalidateMode.onUserInteraction;
                if (_movieKey.currentState!.validate() && image != null) {
                  context.read<OprationBloc>().add(
                        OprationEvent.addData(
                          Movie(
                            userId: Global.users.id,
                            movieId: uuid,
                            movieName: _nameController.text,
                            category: _categoryController.text,
                            releaseDate: _dateController.text,
                            releaseTime: _timeController.text,
                            prodaction: _prodactionController.text,
                            description: _descriptionController.text,
                            image: image!,
                            rating: {
                              Global.users.id.toString(): User(
                                rating: 0,
                                riview: null,
                              ).toJson(),
                            },
                          ),
                        ),
                      );
                  context
                      .read<MovieDataBloc>()
                      .add(const MovieDataEvent.refreshData());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: FxText(text: ConstString.movieImageError),
                    ),
                  );
                  FirebaseCloudHelper.firebaseCloudHelper
                      .deleteImage(key: uuid);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<File> getImage({required ImageSource source}) async {
    XFile? pickedImage = await picker.pickImage(source: source);
    return File(pickedImage!.path);
  }

  void clearController() {
    _nameController.clear();
    _categoryController.clear();
    _dateController.clear();
    _prodactionController.clear();
    _descriptionController.clear();
  }

  void cancelController() {
    _nameController.dispose();
    _categoryController.dispose();
    _dateController.dispose();
    _prodactionController.dispose();
    _descriptionController.dispose();
  }
}
