import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod_base/provider/auth_provider.dart';
import 'package:flutter_riverpod_base/widget/scaffold_padding.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPadding(
      body: const Center(
        child: LoginForm(),
      ),
    );
  }
}

final formKeyProvider = StateProvider<GlobalKey<FormBuilderState>>((ref) => GlobalKey<FormBuilderState>());

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(formKeyProvider);
    final form = formKey.currentState;

    final _authProvider = ref.read(authProvider.notifier);

    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormBuilderTextField(
            name: 'email',
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              // FormBuilderValidators.email(),
            ]),
          ),
          const SizedBox(height: 16),
          FormBuilderTextField(
            name: 'password',
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final value = form!.saveAndValidate();
              if (value) {
                final email = form.value['email'];
                final password = form.value['password'];
                // TODO: Implement login logic
                _authProvider.onSignIn(email: email, password: password);
              }
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 16),
          Text(
            ref.watch(authProvider).toString(),
            style: const TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
