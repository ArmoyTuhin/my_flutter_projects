
class Community {

  int id;
  String createdDate;
  String updatedDate;
  Object deletedDate;
  String firebaseId;
  String name;
  String address;
  String contactPerson;
  String contactInfo;
  String email;
  String password;
  Object latitude;
  Object longitude;
  String type;
  bool isActive;

	Community.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		createdDate = map["createdDate"],
		updatedDate = map["updatedDate"],
		deletedDate = map["deletedDate"],
		firebaseId = map["firebaseId"],
		name = map["name"],
		address = map["address"],
		contactPerson = map["contactPerson"],
		contactInfo = map["contactInfo"],
		email = map["email"],
		password = map["password"],
		latitude = map["latitude"],
		longitude = map["longitude"],
		type = map["type"],
		isActive = map["isActive"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['createdDate'] = createdDate;
		data['updatedDate'] = updatedDate;
		data['deletedDate'] = deletedDate;
		data['firebaseId'] = firebaseId;
		data['name'] = name;
		data['address'] = address;
		data['contactPerson'] = contactPerson;
		data['contactInfo'] = contactInfo;
		data['email'] = email;
		data['password'] = password;
		data['latitude'] = latitude;
		data['longitude'] = longitude;
		data['type'] = type;
		data['isActive'] = isActive;
		return data;
	}
}
