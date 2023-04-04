bool checkString(String? value) =>
    value == null || value
        .toString()
        .trim()
        .isEmpty;

String  defaultStringValue(String? value, String def) =>
    value == null || value
        .toString()
        .trim()
        .isEmpty ? def : value;

bool isEmail(String em) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return !regex.hasMatch(em);
}

bool isSame(String old,String newv) {
  return old==newv?true:false;
}

