import 'dart:io';

class UserInfo {
  num id;
  String token;
  String created_at;
  String nickname;
  String avator;
  String wechat_id;
  num user_mentor;
  num level;
  String user_invite_code;
  UserTaobao user_taobao;
  FriendLevelCount friend_level_count;
  Wallet wallet;
  num monthAmount = 0;//月收益
  File avatorPath = null;
  List todayIncome = null;

  @override
  String toString() {
    return "token=$token, user_taobao= $user_taobao,avator = $avator";
  }

  UserInfo(
      {this.id,
      this.token,
      this.created_at,
      this.nickname,
      this.avator,
      this.wechat_id,
      this.user_mentor,
      this.level,
      this.user_invite_code,
      this.user_taobao,
      this.friend_level_count});

  String get mixNickname {
    if (null != nickname && nickname.isNotEmpty) {
      return nickname;
    }
    return "彩虹优选用户" + id.toString();
  }

  String get wechatId {
    if (null != wechat_id && wechat_id.isNotEmpty) {
      return wechat_id;
    }
    return '未填写';
  }

  /// 总金额,不包括已提现的
  String get totalCash {
//        print("totalCash------------ $wallet");
    if (wallet == null) {
      return "0";
    }
    return ((wallet.amount + wallet.unclaimed_amount - wallet.withdraw_amount) /
            100)
        .toStringAsFixed(2);
  }

  /// 累积收益,包括已提现的
  String get allCash {
//        print("totalCash------------ $wallet");
    if (wallet == null) {
      return "0";
    }
    return ((wallet.amount + wallet.unclaimed_amount + wallet.withdraw_amount) /
            100)
        .toStringAsFixed(2);
  }

  //获取已提现的金额
  String get withdrawAmount {
//        print("totalCash------------ $wallet");
    if (wallet == null) {
      return "0";
    }
    return (wallet.withdraw_amount / 100).toStringAsFixed(2);
  }

  //获取未结算的金额
  String get unclaimedAmount {
//        print("totalCash------------ $wallet");
    if (wallet == null) {
      return "0";
    }
    return (wallet.unclaimed_amount / 100).toStringAsFixed(2);
  }

  /// 获取可提现金额
  String get withdrawCash {
    if (wallet == null) {
      return "0";
    }
//        print("withdrawCash-------------=========== $wallet ");
    return ((wallet.amount - wallet.withdraw_amount) / 100).toStringAsFixed(2);
  }

  /// 今日收益(自己赚)
  String get todayIncomeOwn {
    if (todayIncome == null) {
      return "0";
    }

    var ti;
    for (int i = 0; i < todayIncome.length; i++) {
      if (todayIncome[i]["type"] == "1") {
        ti = todayIncome[i];
      }
    }
    if (ti == null) return "0";
    int amount = int.parse(ti["total_amount"]);
    return (amount / 100).toStringAsFixed(2);
  }

  /// 今日收益(粉丝贡献)
  String get todayIncomeFans {
    if (todayIncome == null) {
      return "0";
    }
    var ti;
    for (int i = 0; i < todayIncome.length; i++) {
      if (todayIncome[i]["type"] == "2") {
        ti = todayIncome[i];
      }
    }
    if (ti == null) return "0";
    int amount = int.parse(ti["total_amount"]);
    return (amount / 100).toStringAsFixed(2);
  }

  /// 今日收益(总收益)
  String get todayIncomeTotal {
    if (todayIncome == null) {
      return "0";
    }

    var tiOwn;
    var tiFans;
    for (int i = 0; i < todayIncome.length; i++) {
      if (todayIncome[i]["type"] == "1") {
        tiOwn = todayIncome[i];
      } else if (todayIncome[i]["type"] == "2") {
        tiFans = todayIncome[i];
      }
    }
    int amountOwn = tiOwn == null ? 0 : int.parse(tiOwn["total_amount"]);
    int amountFans = tiFans == null ? 0 : int.parse(tiFans["total_amount"]);
    if (amountOwn + amountFans <= 0) {
      return "0";
    }
    return ((amountOwn + amountFans) / 100).toStringAsFixed(2);
  }

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    created_at = json['created_at'];
    nickname = json['nickname'];
    avator = json['avator'];
    wechat_id = json['wechat_id'];
    level = json['level'];
    user_mentor = json['user_mentor'];
    user_invite_code = json['user_invite_code'];
    if (json['user_taobao'] != null) {
      user_taobao = UserTaobao.fromJson(json['user_taobao']);
    }
    if (json['wallet'] != null) {
      wallet = Wallet.fromJson(json['wallet']);
    }
    if (json['friend_level_count'] != null) {
      friend_level_count =
          FriendLevelCount.fromJson(json['friend_level_count']);
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
        'created_at': created_at,
        'nickname': nickname,
        'avator': avator,
        'wechat_id': wechat_id,
        'level': level,
        'user_mentor': user_mentor,
        'user_invite_code': user_invite_code,
        'user_taobao': user_taobao?.toJson(),
        'friend_level_count': friend_level_count?.toJson()
      };
}

class UserTaobao {
  num user_id;
  num special_id;
  num relation_id;
  String taobao_user_nick;

  @override
  String toString() {
    return "special_id=$special_id, relation_id= $relation_id";
  }

  UserTaobao(
      {this.user_id, this.special_id, this.relation_id, this.taobao_user_nick});

  UserTaobao.fromJson(Map<String, dynamic> json)
      : user_id = json['user_id'],
        special_id = json['special_id'],
        relation_id = json['relation_id'],
        taobao_user_nick = json['taobao_user_nick'];

  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'special_id': special_id,
        'relation_id': relation_id,
        'taobao_user_nick': taobao_user_nick
      };
}

class Wallet {
  num id;
  num amount;
  num unclaimed_amount;
  num withdraw_amount;
  String code;

  Wallet({
    this.id,
    this.amount,
    this.unclaimed_amount,
    this.withdraw_amount,
    this.code,
  });

  Wallet.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        amount = json['amount'],
        unclaimed_amount = json['unclaimed_amount'],
        withdraw_amount = json['withdraw_amount'],
        code = json['code'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'unclaimed_amount': unclaimed_amount,
        'withdraw_amount': withdraw_amount,
        'code': code,
      };

  @override
  String toString() {
    return "amount=$amount, unclaimed_amount= $unclaimed_amount, withdraw_amount= $withdraw_amount";
  }
}

class FriendLevelCount {
  num directFriendCount; //直接粉丝数
  num indirectFriendCount; //二级粉丝数
  FriendLevelCount({this.directFriendCount, this.indirectFriendCount});

  FriendLevelCount.fromJson(Map<String, dynamic> json)
      : directFriendCount = json['1'],
        indirectFriendCount = json['2'];

  Map<String, dynamic> toJson() => {
        '1': directFriendCount,
        '2': indirectFriendCount,
      };
}
