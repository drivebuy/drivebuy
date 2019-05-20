class Drive {
  String pid;
  Address address;
  List<Availability> availability;
  int price;
  int spaces;
  String accountId;
  String status;

  Drive({
    this.pid,
    this.address,
    this.availability,
    this.price,
    this.spaces,
    this.accountId,
    this.status,
  });

  factory Drive.fromJson(Map<String, dynamic> json) => new Drive(
    pid: json["pid"],
    address: Address.fromJson(json["address"]),
    availability: new List<Availability>.from(json["availability"].map((x) => Availability.fromJson(x))),
    price: json["price"],
    spaces: json["spaces"],
    accountId: json["accountId"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "pid": pid,
    "address": address.toJson(),
    "availability": new List<dynamic>.from(availability.map((x) => x.toJson())),
    "price": price,
    "spaces": spaces,
    "accountId": accountId,
    "status": status,
  };
}

class Address {
  String firstLine;
  String secondLine;
  String county;
  String postcode;

  Address({
    this.firstLine,
    this.secondLine,
    this.county,
    this.postcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => new Address(
    firstLine: json["firstLine"],
    secondLine: json["secondLine"],
    county: json["county"],
    postcode: json["postcode"],
  );

  Map<String, dynamic> toJson() => {
    "firstLine": firstLine,
    "secondLine": secondLine,
    "county": county,
    "postcode": postcode,
  };
}

class Availability {
  String dayOfWeek;
  String from;
  String to;

  Availability({
    this.dayOfWeek,
    this.from,
    this.to,
  });

  factory Availability.fromJson(Map<String, dynamic> json) => new Availability(
    dayOfWeek: json["dayOfWeek"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "dayOfWeek": dayOfWeek,
    "from": from,
    "to": to,
  };
}
