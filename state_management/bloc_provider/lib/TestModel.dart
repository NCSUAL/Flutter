class TestModel{
  int count;
  String name;

  TestModel({required this.count,required this.name});

  TestModel copyWith({int? count, String? name}){
    return TestModel(count: count?? this.count, name: name?? this.name);
  }
}