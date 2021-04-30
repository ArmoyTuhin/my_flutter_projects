
class Flat {

  int id;
  String createdDate;
  String updatedDate;
  Object deletedDate;
  String contact;
  String name;
  String number;
  String description;
  String contactPerson;
  String contactInfo;
  int totalRoom;
  int totalWashRoom;
  int totalBalcony;
  int size;
  bool isRented;
  bool isVacant;

	Flat.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		createdDate = map["createdDate"],
		updatedDate = map["updatedDate"],
		deletedDate = map["deletedDate"],
		contact = map["contact"],
		name = map["name"],
		number = map["number"],
		description = map["description"],
		contactPerson = map["contactPerson"],
		contactInfo = map["contactInfo"],
		totalRoom = map["totalRoom"],
		totalWashRoom = map["totalWashRoom"],
		totalBalcony = map["totalBalcony"],
		size = map["size"],
		isRented = map["isRented"],
		isVacant = map["isVacant"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['createdDate'] = createdDate;
		data['updatedDate'] = updatedDate;
		data['deletedDate'] = deletedDate;
		data['contact'] = contact;
		data['name'] = name;
		data['number'] = number;
		data['description'] = description;
		data['contactPerson'] = contactPerson;
		data['contactInfo'] = contactInfo;
		data['totalRoom'] = totalRoom;
		data['totalWashRoom'] = totalWashRoom;
		data['totalBalcony'] = totalBalcony;
		data['size'] = size;
		data['isRented'] = isRented;
		data['isVacant'] = isVacant;
		return data;
	}
}
