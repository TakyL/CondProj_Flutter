///classe qui fait le lient entre un id calendrier et un id utiliseur
class lien
{
  late int id_cal;
  late int id_user;

  lien(this.id_cal, this.id_user);

  factory lien.convert(value) {
    return lien.json(value['id_cal'].toString(), value['id_user'].toString());
  }

  lien.json(String id, String user) {
    this.id_cal = int.parse(id);
    this.id_user = int.parse(user);
  }

}