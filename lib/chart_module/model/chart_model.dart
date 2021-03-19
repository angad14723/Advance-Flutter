class ChartModel {
  ChartModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.xVal,
    this.yVal,
    this.value,
  });

  String xVal;
  String yVal;
  String value;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        xVal: json["x_val"],
        yVal: json["y_val"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "x_val": xVal,
        "y_val": yVal,
        "value": value,
      };
}
