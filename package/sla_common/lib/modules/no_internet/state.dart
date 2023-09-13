import 'dart:convert';

class NoInternetState {
  var isPending = false;

  NoInternetState({
    required this.isPending,
  });

  NoInternetState.init();

  NoInternetState.empty();

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json["isPending"] = isPending;
    return json;
  }

  @override
  String toString() => json.encode(this);
}
