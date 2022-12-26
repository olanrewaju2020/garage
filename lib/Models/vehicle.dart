class Vehicle  {
  String? vehicleNumber;
  String? company;
  String? regNumber;
  String? color;
  String? image;
  String? model;
  String? ownerId;

  Vehicle(
      {this.vehicleNumber,
      this.company,
      this.regNumber,
      this.color,
      this.image,
      this.model,
      this.ownerId});

  toSaveVehicle() => {
    "vehicleNumber" : vehicleNumber,
    "company" : company,
    "regNumber" : regNumber,
    "color" : color,
    "model" : model,
    "image" : image,
    "ownerId" : ownerId
  };

  factory Vehicle.fromJson(Map<String, dynamic>vehicle) {
    return Vehicle(
      vehicleNumber: vehicle['vehicleNumber'],
      company: vehicle['company'],
      regNumber: vehicle['regNumber'],
      color: vehicle['color'],
      model: vehicle['model'],
      image: vehicle['image'],
      ownerId: vehicle['ownerId'],
    );
  }

}