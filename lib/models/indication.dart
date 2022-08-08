class Indication {
  List<String> _indications;

  Indication(
    this._indications,
  );

  factory Indication.fromMap(Map<String, dynamic> jsonResponse) {
    final indications = jsonResponse['indications'] as List<String>;

    return Indication(indications);
  }

  //Returns a copy of the list to avoid data inconsistence
  List<String> get indications {
    return [..._indications];
  }
}
