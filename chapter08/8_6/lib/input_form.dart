import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hiragana_converter/data.dart';
import 'package:http/http.dart' as http;

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
            onPressed: () async {
              final formState = _formKey.currentState!;
              if (!formState.validate()) {
                return;
              }
              final url = Uri.parse('https://labs.goo.ne.jp/api/hiragana');
              final headers = {'Content-Type': 'application/json'};
              final request = Request(
                appId: const String.fromEnvironment('appId'),
                sentence: _textEditingController.text,
              );
              final result = await http.post(
                url,
                headers: headers,
                body: jsonEncode(request.toJson()),
              );
              final response = Response.fromJson(
                jsonDecode(result.body) as Map<String, Object?>,
              );
              debugPrint('変換結果: ${response.converted}');
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
