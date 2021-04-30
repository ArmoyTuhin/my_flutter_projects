class DoorSensorDataResponse {
  String date;
  Data data;

  DoorSensorDataResponse({this.date, this.data});

  DoorSensorDataResponse.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String doorStatus;
  String batteryStatus;
  String sSID;
  String ipAddress;
  String macAddressOfDevice;

  Data(
      {this.doorStatus,
        this.batteryStatus,
        this.sSID,
        this.ipAddress,
        this.macAddressOfDevice});

  Data.fromJson(Map<String, dynamic> json) {
    doorStatus = json['doorStatus'];
    batteryStatus = json['batteryStatus'];
    sSID = json['SSID'];
    ipAddress = json['ipAddress'];
    macAddressOfDevice = json['macAddressOfDevice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doorStatus'] = this.doorStatus;
    data['batteryStatus'] = this.batteryStatus;
    data['SSID'] = this.sSID;
    data['ipAddress'] = this.ipAddress;
    data['macAddressOfDevice'] = this.macAddressOfDevice;
    return data;
  }
}
