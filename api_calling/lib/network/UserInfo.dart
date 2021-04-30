class UserInfo {
	String status;
	int statusCode;
	Data data;
	List<Null> errors;

	UserInfo({this.status, this.statusCode, this.data, this.errors});

	UserInfo.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		statusCode = json['statusCode'];
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
		if (json['errors'] != null) {
			errors = new List<Null>();
			json['errors'].forEach((v) {
				errors.add((v));
			});
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = this.status;
		data['statusCode'] = this.statusCode;
		if (this.data != null) {
			data['data'] = this.data.toJson();
		}

		return data;
	}
}

class Data {
	int id;
	String createdDate;
	String updatedDate;
	Null deletedDate;
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

	Data(
			{this.id,
				this.createdDate,
				this.updatedDate,
				this.deletedDate,
				this.firebaseId,
				this.name,
				this.phone,
				this.email,
				this.address,
				this.organization,
				this.nid,
				this.password,
				this.gender,
				this.age,
				this.contactPersonPhone,
				this.contactPersonName,
				this.image,
				this.thumbImage,
				this.primaryRoleCode,
				this.isActive,
				this.building,
				this.community,
				this.flat});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		createdDate = json['createdDate'];
		updatedDate = json['updatedDate'];
		deletedDate = json['deletedDate'];
		firebaseId = json['firebaseId'];
		name = json['name'];
		phone = json['phone'];
		email = json['email'];
		address = json['address'];
		organization = json['organization'];
		nid = json['nid'];
		password = json['password'];
		gender = json['gender'];
		age = json['age'];
		contactPersonPhone = json['contactPersonPhone'];
		contactPersonName = json['contactPersonName'];
		image = json['image'];
		thumbImage = json['thumbImage'];
		primaryRoleCode = json['primaryRoleCode'];
		isActive = json['isActive'];
		building = json['building'] != null
				? new Building.fromJson(json['building'])
				: null;
		community = json['community'] != null
				? new Community.fromJson(json['community'])
				: null;
		flat = json['flat'] != null ? new Flat.fromJson(json['flat']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['createdDate'] = this.createdDate;
		data['updatedDate'] = this.updatedDate;
		data['deletedDate'] = this.deletedDate;
		data['firebaseId'] = this.firebaseId;
		data['name'] = this.name;
		data['phone'] = this.phone;
		data['email'] = this.email;
		data['address'] = this.address;
		data['organization'] = this.organization;
		data['nid'] = this.nid;
		data['password'] = this.password;
		data['gender'] = this.gender;
		data['age'] = this.age;
		data['contactPersonPhone'] = this.contactPersonPhone;
		data['contactPersonName'] = this.contactPersonName;
		data['image'] = this.image;
		data['thumbImage'] = this.thumbImage;
		data['primaryRoleCode'] = this.primaryRoleCode;
		data['isActive'] = this.isActive;
		if (this.building != null) {
			data['building'] = this.building.toJson();
		}
		if (this.community != null) {
			data['community'] = this.community.toJson();
		}
		if (this.flat != null) {
			data['flat'] = this.flat.toJson();
		}
		return data;
	}
}

class Building {
	int id;
	String createdDate;
	String updatedDate;
	Null deletedDate;
	String name;
	String address;
	String contactPerson;
	String contactInfo;
	Null flatFormat;
	int totalFlat;
	int totalFloor;
	int totalGate;
	int totalParking;
	Null latitude;
	Null longitude;
	bool isActive;

	Building(
			{this.id,
				this.createdDate,
				this.updatedDate,
				this.deletedDate,
				this.name,
				this.address,
				this.contactPerson,
				this.contactInfo,
				this.flatFormat,
				this.totalFlat,
				this.totalFloor,
				this.totalGate,
				this.totalParking,
				this.latitude,
				this.longitude,
				this.isActive});

	Building.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		createdDate = json['createdDate'];
		updatedDate = json['updatedDate'];
		deletedDate = json['deletedDate'];
		name = json['name'];
		address = json['address'];
		contactPerson = json['contactPerson'];
		contactInfo = json['contactInfo'];
		flatFormat = json['flatFormat'];
		totalFlat = json['totalFlat'];
		totalFloor = json['totalFloor'];
		totalGate = json['totalGate'];
		totalParking = json['totalParking'];
		latitude = json['latitude'];
		longitude = json['longitude'];
		isActive = json['isActive'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['createdDate'] = this.createdDate;
		data['updatedDate'] = this.updatedDate;
		data['deletedDate'] = this.deletedDate;
		data['name'] = this.name;
		data['address'] = this.address;
		data['contactPerson'] = this.contactPerson;
		data['contactInfo'] = this.contactInfo;
		data['flatFormat'] = this.flatFormat;
		data['totalFlat'] = this.totalFlat;
		data['totalFloor'] = this.totalFloor;
		data['totalGate'] = this.totalGate;
		data['totalParking'] = this.totalParking;
		data['latitude'] = this.latitude;
		data['longitude'] = this.longitude;
		data['isActive'] = this.isActive;
		return data;
	}
}

class Community {
	int id;
	String createdDate;
	String updatedDate;
	Null deletedDate;
	String firebaseId;
	String name;
	String address;
	String contactPerson;
	String contactInfo;
	String email;
	String password;
	Null latitude;
	Null longitude;
	String type;
	bool isActive;

	Community(
			{this.id,
				this.createdDate,
				this.updatedDate,
				this.deletedDate,
				this.firebaseId,
				this.name,
				this.address,
				this.contactPerson,
				this.contactInfo,
				this.email,
				this.password,
				this.latitude,
				this.longitude,
				this.type,
				this.isActive});

	Community.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		createdDate = json['createdDate'];
		updatedDate = json['updatedDate'];
		deletedDate = json['deletedDate'];
		firebaseId = json['firebaseId'];
		name = json['name'];
		address = json['address'];
		contactPerson = json['contactPerson'];
		contactInfo = json['contactInfo'];
		email = json['email'];
		password = json['password'];
		latitude = json['latitude'];
		longitude = json['longitude'];
		type = json['type'];
		isActive = json['isActive'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['createdDate'] = this.createdDate;
		data['updatedDate'] = this.updatedDate;
		data['deletedDate'] = this.deletedDate;
		data['firebaseId'] = this.firebaseId;
		data['name'] = this.name;
		data['address'] = this.address;
		data['contactPerson'] = this.contactPerson;
		data['contactInfo'] = this.contactInfo;
		data['email'] = this.email;
		data['password'] = this.password;
		data['latitude'] = this.latitude;
		data['longitude'] = this.longitude;
		data['type'] = this.type;
		data['isActive'] = this.isActive;
		return data;
	}
}

class Flat {
	int id;
	String createdDate;
	String updatedDate;
	Null deletedDate;
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

	Flat(
			{this.id,
				this.createdDate,
				this.updatedDate,
				this.deletedDate,
				this.contact,
				this.name,
				this.number,
				this.description,
				this.contactPerson,
				this.contactInfo,
				this.totalRoom,
				this.totalWashRoom,
				this.totalBalcony,
				this.size,
				this.isRented,
				this.isVacant});

	Flat.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		createdDate = json['createdDate'];
		updatedDate = json['updatedDate'];
		deletedDate = json['deletedDate'];
		contact = json['contact'];
		name = json['name'];
		number = json['number'];
		description = json['description'];
		contactPerson = json['contactPerson'];
		contactInfo = json['contactInfo'];
		totalRoom = json['totalRoom'];
		totalWashRoom = json['totalWashRoom'];
		totalBalcony = json['totalBalcony'];
		size = json['size'];
		isRented = json['isRented'];
		isVacant = json['isVacant'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['createdDate'] = this.createdDate;
		data['updatedDate'] = this.updatedDate;
		data['deletedDate'] = this.deletedDate;
		data['contact'] = this.contact;
		data['name'] = this.name;
		data['number'] = this.number;
		data['description'] = this.description;
		data['contactPerson'] = this.contactPerson;
		data['contactInfo'] = this.contactInfo;
		data['totalRoom'] = this.totalRoom;
		data['totalWashRoom'] = this.totalWashRoom;
		data['totalBalcony'] = this.totalBalcony;
		data['size'] = this.size;
		data['isRented'] = this.isRented;
		data['isVacant'] = this.isVacant;
		return data;
	}
}