enum ApiStatus {none, loading, done}
enum ChatType{chat, phone}
enum ErrorType {
  error,
  success,
  warning,
  info
}
enum ServiceType {none, inspection, servicing, rescueService, repair}


ServiceTypeString(ServiceType type) {
  switch(type) {
    case ServiceType.inspection:
        return 'Vehicle Inspection';
    case ServiceType.repair:
        return 'Vehicle Repair';
    case ServiceType.servicing:
      return 'Vehicle Servicing';
    case ServiceType.rescueService:
      return 'Rescue Service';
    default:
      return 'Vehicle Inspection';
  }

}