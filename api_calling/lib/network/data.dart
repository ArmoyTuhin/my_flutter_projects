import 'package:api_calling/network/building.dart';
import 'package:api_calling/network/community.dart';
import 'package:api_calling/network/flat.dart';

class Data {

  int id;
  String createdDate;
  String updatedDate;
  Object deletedDate;
  String firebaseId;
  String name;
  String phone;
  String email;
  String address;
  String organization;
  String nid;
  String password;
  String gender;
  int age;
  String contactPersonPhone;
  String contactPersonName;
  String image;
  String thumbImage;
  String primaryRoleCode;
  bool isActive;
  Building building;
  Community community;
  Flat flat;

	Data.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		createdDate = map["createdDate"],
		updatedDate = map["updatedDate"],
		deletedDate = map["deletedDate"],
		firebaseId = map["firebaseId"],
		name = map["name"],
		phone = map["phone"],
		email = map["email"],
		address = map["address"],
		organization = map["organization"],
		nid = map["nid"],
		password = map["password"],
		gender = map["gender"],
		age = map["age"],
		contactPersonPhone = map["contactPersonPhone"],
		contactPersonName = map["contactPersonName"],
		image = map["image"],
		thumbImage = map["thumbImage"],
		primaryRoleCode = map["primaryRoleCode"],
		isActive = map["isActive"],
		building = Building.fromJsonMap(map["building"]),
		community = Community.fromJsonMap(map["community"]),
		flat = Flat.fromJsonMap(map["flat"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['createdDate'] = createdDate;
		data['updatedDate'] = updatedDate;
		data['deletedDate'] = deletedDate;
		data['firebaseId'] = firebaseId;
		data['name'] = name;
		data['phone'] = phone;
		data['email'] = email;
		data['address'] = address;
		data['organization'] = organization;
		data['nid'] = nid;
		data['password'] = password;
		data['gender'] = gender;
		data['age'] = age;
		data['contactPersonPhone'] = contactPersonPhone;
		data['contactPersonName'] = contactPersonName;
		data['image'] = image;
		data['thumbImage'] = thumbImage;
		data['primaryRoleCode'] = primaryRoleCode;
		data['isActive'] = isActive;
		data['building'] = building == null ? null : building.toJson();
		data['community'] = community == null ? null : community.toJson();
		data['flat'] = flat == null ? null : flat.toJson();
		return data;
	}
}
