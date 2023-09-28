import 'package:flutter/material.dart';

import '../../../utills/Theme/app_text.dart';

class SearchLocationComponents {
  textField({String hint = "Hint", TextEditingController? controller}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: Color(0xff344853),
          contentPadding: EdgeInsets.only(left: 8),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              //color: Color.fromARGB(255, 225, 225, 225),
              color: Colors.white,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 225, 225, 225),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 225, 225, 225), width: 0.5),
            borderRadius: BorderRadius.circular(6),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff939292),
          ),
        ),
      ),
    );
  }

  textFieldSearch(
      {String hint = "Hint",
      GestureTapCallback? onSufixIconPressed,
      Function? onChangeText,
      TextEditingController? controller}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextField(
        cursorColor: Colors.white,
        onChanged: (value) {
          try {
            onChangeText!(value);
          } catch (e) {}
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          suffixIcon: InkWell(
            onTap: onSufixIconPressed,
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          fillColor: Color(0xff344853),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 225, 225, 225),
              width: 0.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 225, 225, 225),
              width: 0.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 225, 225, 225),
              width: 0.5,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff939292),
          ),
        ),
      ),
    );
  }

  card({
    String locationName = "Lavington",
    String locationDetails = "James Gichuru Road, Nairobi",
    GestureTapCallback? onPressed,
    required double width,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.65,
                      child: AppText.text(
                        locationName,
                        fontsize: 14,
                        textAlignment: TextAlign.left,
                        fontweight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                        width: width * 0.65,
                        child: AppText.text(
                          locationDetails,
                          textAlignment: TextAlign.left,
                          fontsize: 10,
                          fontweight: FontWeight.w400,
                          color: Color(0xff768196),
                        )),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Color(0xff7F7C6B),
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
