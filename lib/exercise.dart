enum  Test{
  one,
  two,
  three,
}

extension TestExtension on Test{
  bool get isOne => this == Test.one;
  void check(){
    Test test = TestEnum._getTest();
    if(test.isOne){

    }
  }
}


class TestEnum{
  static Test _getTest(){
    return Test.one;
  }
}