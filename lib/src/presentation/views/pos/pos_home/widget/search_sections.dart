import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class SearchSeactions extends StatelessWidget {
  const SearchSeactions({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 10,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Azozy Cafee',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                S.current.sections,
                style: const TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: screenWidth >= 600 ? screenWidth * 0.40 : screenWidth * 0.60,
            height: 30,
            child: CustomeTextFormField(
              labelText: S.current.search,
              suffixIcon: const Icon(Icons.search),
              obscureText: false,
              keyboardType: TextInputType.text,
              textEditingController: null,
              validator: (value) {
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
