import 'package:aban_tether/src/features/profile/domain/models/entities/me_entity.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  final MeEntity meEntity;
  const ProfileForm({super.key, required this.meEntity,});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [

      TextFormField(
        initialValue: meEntity.name,
        enabled: false,
        readOnly: true,
        decoration: const InputDecoration(labelText: "name"),
      ),
        const SizedBox(height: 16),

        TextFormField(
          initialValue: meEntity.email,
          readOnly: true,
          enabled: false,
          decoration: const InputDecoration(hintText: "email"),
        )

      ],
    );
  }
}
