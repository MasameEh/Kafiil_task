import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafil/controller/stringmultitags_controller.dart';

import 'package:textfield_tags/textfield_tags.dart';

import '../../data/models/user.dart';
import '../../themes.dart';

class StringMultilineTags extends StatefulWidget {
  const StringMultilineTags({super.key, this.tags, this.readOnly = false});
  final List<Tag>? tags;
  final bool? readOnly;

  @override
  State<StringMultilineTags> createState() => _StringMultilineTagsState();
}

class _StringMultilineTagsState extends State<StringMultilineTags> {
  MultiTagsController con = Get.find();

  late double _distanceToField;
  late StringTagController _stringTagController;
  List<String> _initialTags = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _stringTagController = StringTagController();

    // Initialize _initialTags based on widget.tags
    if (widget.tags == null || widget.tags!.isEmpty) {
      _initialTags = <String>[
        'التدقيق اللغوي',
        'تصميم المواقع الإلكترونية',
        'إنتاج الفيديو',
      ];
    } else {
      _initialTags = widget.tags!.map((tag) => tag.name).toList();
    }

    // Populate the controller's tags list with initial tags
    con.tags.clear();
    con.tags.addAll(_initialTags);

    setState(() {});
  }

  @override
  void dispose() {
    _stringTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Skills',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            )),
        const SizedBox(
          height: 5,
        ),
        TextFieldTags<String>(
          textfieldTagsController: _stringTagController,
          initialTags: _initialTags,
          textSeparators: const [','],
          letterCase: LetterCase.normal,
          validator: (String tag) {
            if (tag == 'php') {
              return 'No, please just no';
            } else if (_stringTagController.getTags!.contains(tag)) {
              return 'You\'ve already entered that';
            }
            return null;
          },
          inputFieldBuilder: (context, inputFieldValues) {
            return Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
                color: Colors.grey[50],
              ),
              child: GetBuilder<MultiTagsController>(
                builder: (controller) {
                  return TextField(
                    onTap: () {
                      _stringTagController.getFocusNode?.requestFocus();
                    },
                    controller: inputFieldValues.textEditingController,
                    focusNode: inputFieldValues.focusNode,
                    readOnly: widget.readOnly ?? false,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: inputFieldValues.tags.isNotEmpty ? '' : "Enter Skill ...",
                      errorText: inputFieldValues.error,
                      prefixIconConstraints: BoxConstraints(maxWidth: _distanceToField * 0.8),
                      prefixIcon: inputFieldValues.tags.isNotEmpty
                          ? SingleChildScrollView(
                        controller: inputFieldValues.tagScrollController,
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 8,
                          ),
                          child: Wrap(
                              runSpacing: 4.0,
                              spacing: 4.0,
                              children: inputFieldValues.tags.map((String tag) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Colors.green.withOpacity(.1),
                                  ),
                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        child: Text(
                                          tag,
                                          style: const TextStyle(color: primaryColor),
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                      InkWell(
                                        child: const Icon(
                                          Icons.close,
                                          size: 14.0,
                                          color: primaryColor,
                                        ),
                                        onTap: () {
                                          if(widget.readOnly == false){
                                            inputFieldValues.onTagRemoved(tag);
                                            print(tag);
                                            con.removeTag(tag);  // Remove tag from the controller
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }).toList()),
                        ),
                      )
                          : null,
                    ),
                    onChanged: inputFieldValues.onTagChanged,
                    onSubmitted: (tag) {
                      inputFieldValues.onTagSubmitted(tag);
                      con.addTag(tag);  // Add tag to the controller
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
