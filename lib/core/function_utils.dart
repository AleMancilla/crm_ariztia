import 'package:flutter/material.dart';

Size getSizeByContext(BuildContext context) {
  return MediaQuery.of(context).size;
}

selectedBusiness(String urlImage, String title, Function onpress) {
  return Builder(builder: (context) {
    return Material(
      child: InkWell(
        onTap: () => onpress(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 0.5, color: Colors.black38),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    urlImage,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              // Icon(
              //   Icons.arrow_drop_down_rounded,
              //   color: Theme.of(context).primaryColor,
              //   size: 40,
              // )
            ],
          ),
        ),
      ),
    );
  });
}
