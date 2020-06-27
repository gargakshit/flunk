class GQLData {
  Data data;

  GQLData({this.data});

  GQLData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Viewer viewer;

  Data({this.viewer});

  Data.fromJson(Map<String, dynamic> json) {
    viewer =
        json['viewer'] != null ? new Viewer.fromJson(json['viewer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.viewer != null) {
      data['viewer'] = this.viewer.toJson();
    }
    return data;
  }
}

class Viewer {
  Repositories repositories;

  Viewer({this.repositories});

  Viewer.fromJson(Map<String, dynamic> json) {
    repositories = json['repositories'] != null
        ? new Repositories.fromJson(json['repositories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.repositories != null) {
      data['repositories'] = this.repositories.toJson();
    }
    return data;
  }
}

class Repositories {
  int totalCount;
  List<RepoEdges> repoEdges;

  Repositories({this.totalCount, this.repoEdges});

  Repositories.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['repoEdges'] != null) {
      repoEdges = new List<RepoEdges>();
      json['repoEdges'].forEach((v) {
        repoEdges.add(new RepoEdges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.repoEdges != null) {
      data['repoEdges'] = this.repoEdges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepoEdges {
  RepoNodes repoNodes;

  RepoEdges({this.repoNodes});

  RepoEdges.fromJson(Map<String, dynamic> json) {
    repoNodes = json['repoNodes'] != null
        ? new RepoNodes.fromJson(json['repoNodes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.repoNodes != null) {
      data['repoNodes'] = this.repoNodes.toJson();
    }
    return data;
  }
}

class RepoNodes {
  String id;
  String name;
  Languages languages;
  DefaultBranchRef defaultBranchRef;

  RepoNodes({this.id, this.name, this.languages, this.defaultBranchRef});

  RepoNodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    languages = json['languages'] != null
        ? new Languages.fromJson(json['languages'])
        : null;
    defaultBranchRef = json['defaultBranchRef'] != null
        ? new DefaultBranchRef.fromJson(json['defaultBranchRef'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.languages != null) {
      data['languages'] = this.languages.toJson();
    }
    if (this.defaultBranchRef != null) {
      data['defaultBranchRef'] = this.defaultBranchRef.toJson();
    }
    return data;
  }
}

class Languages {
  List<LanguageEdges> languageEdges;

  Languages({this.languageEdges});

  Languages.fromJson(Map<String, dynamic> json) {
    if (json['languageEdges'] != null) {
      languageEdges = new List<LanguageEdges>();
      json['languageEdges'].forEach((v) {
        languageEdges.add(new LanguageEdges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.languageEdges != null) {
      data['languageEdges'] =
          this.languageEdges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LanguageEdges {
  LanguageNode languageNode;

  LanguageEdges({this.languageNode});

  LanguageEdges.fromJson(Map<String, dynamic> json) {
    languageNode = json['languageNode'] != null
        ? new LanguageNode.fromJson(json['languageNode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.languageNode != null) {
      data['languageNode'] = this.languageNode.toJson();
    }
    return data;
  }
}

class LanguageNode {
  String id;
  String name;

  LanguageNode({this.id, this.name});

  LanguageNode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class DefaultBranchRef {
  Target target;

  DefaultBranchRef({this.target});

  DefaultBranchRef.fromJson(Map<String, dynamic> json) {
    target =
        json['target'] != null ? new Target.fromJson(json['target']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.target != null) {
      data['target'] = this.target.toJson();
    }
    return data;
  }
}

class Target {
  History history;

  Target({this.history});

  Target.fromJson(Map<String, dynamic> json) {
    history =
        json['history'] != null ? new History.fromJson(json['history']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.history != null) {
      data['history'] = this.history.toJson();
    }
    return data;
  }
}

class History {
  int totalCount;
  List<CommitEdges> commitEdges;

  History({this.totalCount, this.commitEdges});

  History.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['commitEdges'] != null) {
      commitEdges = new List<CommitEdges>();
      json['commitEdges'].forEach((v) {
        commitEdges.add(new CommitEdges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.commitEdges != null) {
      data['commitEdges'] = this.commitEdges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommitEdges {
  CommitNode commitNode;

  CommitEdges({this.commitNode});

  CommitEdges.fromJson(Map<String, dynamic> json) {
    commitNode = json['commitNode'] != null
        ? new CommitNode.fromJson(json['commitNode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commitNode != null) {
      data['commitNode'] = this.commitNode.toJson();
    }
    return data;
  }
}

class CommitNode {
  String messageHeadline;
  String authoredDate;

  CommitNode({this.messageHeadline, this.authoredDate});

  CommitNode.fromJson(Map<String, dynamic> json) {
    messageHeadline = json['messageHeadline'];
    authoredDate = json['authoredDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageHeadline'] = this.messageHeadline;
    data['authoredDate'] = this.authoredDate;
    return data;
  }
}
