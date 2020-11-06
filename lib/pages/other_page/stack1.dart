library stack1;
// 顶层变量和类变量一起被称为静态变量
final _contents = [];
get isEmpty =>  _contents.isEmpty;
get top => isEmpty ? 'can not get top' : _contents.last;
get pop => isEmpty ? 'can not pop empty' : _contents.removeLast();

push(e){
  _contents.add(e);
  return e;
}