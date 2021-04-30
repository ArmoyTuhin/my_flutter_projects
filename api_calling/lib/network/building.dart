
class Building {

  int id;
  String createdDate;
  String updatedDate;
  Object deletedDate;
  String name;
  String address;
  String contactPerson;
  String contactInfo;
  Object flatFormat;
  int totalFlat;
  int totalFloor;
  int totalGate;
  int totalParking;
  Object latitude;
  Object longitude;
  bool isActive;

	Building.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		createdDate = map["createdDate"],
		updatedDate = map["updatedDate"],
		deletedDate = map["deletedDate"],
		name = map["name"],
		address = map["address"],
		contactPerson = map["contactPerson"],
		contactInfo = map["contactInfo"],
		flatFormat = map["flatFormat"],
		totalFlat = map["totalFlat"],
		totalFloor = map["totalFloor"],
		totalGate = map["totalGate"],
		totalParking = map["totalParking"],
		latitude = map["latitude"],
		longitude = map["longitude"],
		isActive = map["isActive"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['createdDate'] = createdDate;
		data['updatedDate'] = updatedDate;
		data['deletedDate'] = deletedDate;
		data['name'] = name;
		data['address'] = address;
		data['contactPerson'] = contactPerson;
		data['contactInfo'] = contactInfo;
		data['flatFormat'] = flatFormat;
		data['totalFlat'] = totalFlat;
		data['totalFloor'] = totalFloor;
		data['totalGate'] = totalGate;
		data['totalParking'] = totalParking;
		data['latitude'] = latitude;
		data['longitude'] = longitude;
		data['isActive'] = isActive;
		return data;
	}
}
