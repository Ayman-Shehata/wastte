  int getPrice(int num) {
     int _price = 0;
//setState(() {
      if (num >= 0 && num <= 8) {
        _price = num * 5;
      } else if (num > 8 && num <= 15) {
        _price = num * 6;
      } else if (num > 15) {
        _price = num * 9;
      } else {
        // handle default case, e.g. return an error message
        // _price = 0;
        throw Exception('Invalid number');
      }
      
    //});
    return _price;
  }
