class Vehicle  {
  String? vehicleNumber;
  String? company;
  String? regNumber;
  String? color;
  String? image;
  String? model;
  String? ownerId;
  String? status;

  Vehicle(
      {this.vehicleNumber,
      this.company,
      this.regNumber,
      this.color,
      this.image,
      this.model,
      this.ownerId, this.status});

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
      status: vehicle['status'],
    );
  }

  @override
  String toString() {
    return 'Vehicle{vehicleNumber: $vehicleNumber, company: $company, regNumber: $regNumber, color: $color, image: $image, model: $model, ownerId: $ownerId, status: $status}';
  }
}