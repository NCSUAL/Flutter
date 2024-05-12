class Practice{
  int? postId;      //Optional
  int? id;
  String? name;
  String? email;
  String? body;

  //생성자
  Practice({this.postId,this.id,this.email,this.body,this.name}); //null도 포함해서 required 안씀

  //팩토리 생성자 -> c++
  factory Practice.fromJSON(Map<String, dynamic> JSON) => Practice(
      body: JSON['body'],
      email: JSON['email'],
      id: JSON['id'],
      name: JSON['name'],
      postId: JSON['postId']
  );
}