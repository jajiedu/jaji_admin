class RiceTextModel {
  List<P>? p;

  RiceTextModel({this.p});

  RiceTextModel.fromJson(Map<String, dynamic> json) {
    if (json['p'] != null) {
      p = <P>[];
      json['p'].forEach((v) {
        p!.add(new P.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.p != null) {
      data['p'] = this.p!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class P {
  List<Ruby>? ruby;
  List<String>? text;

  P({this.ruby, this.text});

  P.fromJson(Map<String, dynamic> json) {
    if (json['ruby'] != null) {
      ruby = <Ruby>[];
      json['ruby'].forEach((v) {
        ruby!.add(new Ruby.fromJson(v));
      });
    }
    text = json['#text'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ruby != null) {
      data['ruby'] = this.ruby!.map((v) => v.toJson()).toList();
    }
    data['#text'] = this.text;
    return data;
  }
}

class Ruby {
  List<String>? rp;
  String? rt;
  String? text;
  U? u;

  Ruby({this.rp, this.rt, this.text, this.u});

  Ruby.fromJson(Map<String, dynamic> json) {
    rp = json['rp'].cast<String>();
    rt = json['rt'];
    text = json['#text'];
    u = json['u'] != null ? new U.fromJson(json['u']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rp'] = this.rp;
    data['rt'] = this.rt;
    data['#text'] = this.text;
    if (this.u != null) {
      data['u'] = this.u!.toJson();
    }
    return data;
  }
}

class U {
  Strong? strong;

  U({this.strong});

  U.fromJson(Map<String, dynamic> json) {
    strong =
        json['strong'] != null ? new Strong.fromJson(json['strong']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.strong != null) {
      data['strong'] = this.strong!.toJson();
    }
    return data;
  }
}

class Strong {
  String? em;

  Strong({this.em});

  Strong.fromJson(Map<String, dynamic> json) {
    em = json['em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['em'] = this.em;
    return data;
  }
}
