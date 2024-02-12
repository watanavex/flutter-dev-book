import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});
  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  /* 
  ◆ TextEditingController
  TextField Widgetの入力文字や選択文字を取得、変更する機能を持つ */
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /* 
    ◆ Form
    TextFormFieldやFormFieldを
    グループ化して管理するWidget 
    */
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            /* 
            ◆ TextFormField
            テキスト入力フォームを実現するWidget
            */
            child: TextFormField(
              controller: _textEditingController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: '文章を入力してください',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '文章が入力されていません';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final formState = _formKey.currentState!;
              if (!formState.validate()) {
                return;
              }
              debugPrint('text = ${_textEditingController.text}');
            },
            child: const Text(
              '変換',
            ),
          ),
        ],
      ),
    );
  }
}
