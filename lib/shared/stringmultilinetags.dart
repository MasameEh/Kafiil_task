import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../themes.dart';


class StringMultilineTags extends StatefulWidget {
  const StringMultilineTags({Key? key}) : super(key: key);

  @override
  State<StringMultilineTags> createState() => _StringMultilineTagsState();
}

class _StringMultilineTagsState extends State<StringMultilineTags> {
  late double _distanceToField;
  late StringTagController _stringTagController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _stringTagController = StringTagController();
  }

  @override
  void dispose() {
    super.dispose();
    _stringTagController.dispose();
  }

  static const List<String> _initialTags = <String>[
    'Video Production',
    'c',
    'java',
    'python',
    'javascript',
    'sql',
    'html',
    'css',
  ];

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Skills',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                )
            ),
            const SizedBox(height: 5,),
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
                    border: Border.all(
                    color: Colors.white
                    ),
                    color: Colors.grey[50],
                    ),
                    child: TextField(
                      onTap: () {
                        _stringTagController.getFocusNode?.requestFocus();
                      },
                      controller: inputFieldValues.textEditingController,
                      focusNode: inputFieldValues.focusNode,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,

                        focusedBorder: InputBorder.none,
                        hintText: inputFieldValues.tags.isNotEmpty
                            ? ''
                            : "Enter Skill ...",
                        errorText: inputFieldValues.error,
                        prefixIconConstraints:
                        BoxConstraints(maxWidth: _distanceToField * 0.8),
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
                                children:
                                inputFieldValues.tags.map((String tag) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      color: Colors.green.withOpacity(.1),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            '$tag',
                                            style: const TextStyle(
                                                color: primaryColor),
                                          ),
                                          onTap: () {
                                            //print("$tag selected");
                                          },
                                        ),
                                        const SizedBox(width: 4.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.close,
                                            size: 14.0,
                                            color: primaryColor,
                                          ),
                                          onTap: () {
                                            inputFieldValues
                                                .onTagRemoved(tag);
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
                      onSubmitted: inputFieldValues.onTagSubmitted ,
                    ),
                );
              },
            ),
          ],
      );
  }
}