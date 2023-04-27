import 'package:jiffy/jiffy.dart';

class VehicleService {
  String? serviceProviderUuid, serviceOwnerUuid, vehicleUuid,
      serviceType, ownerComplain, transDate;


  VehicleService(
      {this.serviceProviderUuid,
      this.serviceOwnerUuid,
      this.vehicleUuid,
      this.serviceType,
      this.ownerComplain,
      this.transDate});

  toNewService()  => {
    "serviceproviderUuid" : serviceProviderUuid,
    "serviceOwnerUuid" : serviceOwnerUuid,
    "vehicleUuid" : vehicleUuid,
    "service_type" : serviceType,
    "owner_complain" : ownerComplain,
    "trans_date" : transDate
  };

  @override
  String toString() {
    return 'VehicleService{serviceProviderUuid: $serviceProviderUuid, '
        'serviceOwnerUuid: $serviceOwnerUuid, vehicleUuid: $vehicleUuid, '
        'serviceType: $serviceType, ownerComplain: $ownerComplain, transDate: $transDate}';
  }
}