/*class Entry {
  final String title;
  final int type;
  final List<Entry> children;
  Entry(this.title , {this.type = 1, }, [this.children = <Entry>[]]);


}*/

class Entry {
  final String title;
  final int type;
  final List<Entry> children;
  Entry(this.title, this.type, [this.children = const <Entry>[]]);
}
