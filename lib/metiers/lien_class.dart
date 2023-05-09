class lien {
  late int id_cal;
  late int id_user;

  lien(this.id_cal, this.id_user);
  // Define a factory method called "convert" that takes in a value parameter
  factory lien.convert(value) {
    // Create a new instance of the "lien" class and return it
    // The values for the "id_cal" and "id_user" variables are extracted from the "value" parameter
    return lien.json(value['id_cal'].toString(), value['id_user'].toString());
  }
  // Define a named constructor called "json" that takes in two string arguments
  lien.json(String id, String user) {
    // Parse the "id" and "user" string arguments to integers and assign them to the "id_cal" and "id_user" variables, respectively
    this.id_cal = int.parse(id);
    this.id_user = int.parse(user);
  }
}
