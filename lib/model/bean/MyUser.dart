class MyUser {
    num id;
    String token;
    bool isNewUser;
    String nickname;
    String avator;
    String wechatId;
    num specialId;
    num relationId;
    String taobaoUserNick;
    num level;
    String inviteCode;
    num amount;
    num totalAmount;
    num createAmount;
    num confirmAmount;
    num friendAmount;
    num friendTotalAmount;
    num friendCreateAmount;
    num friendConfirmAmount;
    num todayTotalAmount;
    num monthTotalAmount;
    num friendCount;
    num friendFriendCount;
    num mentorId;
    String mentorName;
    String mentorWechatId;
    String createAt;

    MyUser({this.id,
        this.token,
        this.isNewUser,
        this.nickname,
        this.avator,
        this.wechatId,
        this.specialId,
        this.relationId,
        this.taobaoUserNick,
        this.level,
        this.inviteCode,
        this.amount,
        this.totalAmount,
        this.createAmount,
        this.confirmAmount,
        this.friendAmount,
        this.friendTotalAmount,
        this.friendCreateAmount,
        this.friendConfirmAmount,
        this.todayTotalAmount,
        this.monthTotalAmount,
        this.friendCount,
        this.friendFriendCount,
        this.mentorId,
        this.mentorName,
        this.mentorWechatId,
        this.createAt});

    //累积预估收益
    String get estimateTotal {
        if (createAmount == 0 && confirmAmount == 0 && totalAmount == 0) {
            return '0';
        }
        return ((createAmount + confirmAmount + totalAmount) / 100)
            .toStringAsFixed(2);
    }

    //粉丝贡献预估累积收益
    String get fansEstimateTotal {
        if (friendCreateAmount == 0 &&
            friendConfirmAmount == 0 &&
            friendTotalAmount == 0) {
            return '0';
        }
        return ((friendCreateAmount + friendConfirmAmount + friendTotalAmount) /
            100)
            .toStringAsFixed(2);
    }

    //今日预估
    String get todayEstimateTAmount {
        if (todayTotalAmount == 0) {
            return '0';
        }
        return (todayTotalAmount / 100).toStringAsFixed(2);
    }

    //本月预估
    String get monthEstimateTAmount {
        if (monthTotalAmount == 0) {
            return '0';
        }
        return (monthTotalAmount / 100).toStringAsFixed(2);
    }

    //账户余额 可提现的数据
    String get balanceAmount {
        if (amount == 0) {
            return '0';
        }
        return (amount / 100).toStringAsFixed(2);
    }

    //累积到账
    String get accumulateAmount {
        if (totalAmount == 0) {
            return '0';
        }
        return (totalAmount / 100).toStringAsFixed(2);
    }

    //已提现数据
    String get withdrawAmount {
        if (totalAmount - amount == 0) {
            return '0';
        }
        return ((totalAmount - amount) / 100).toStringAsFixed(2);
    }

    String get notAccountAmount {
        if (confirmAmount == 0) {
            return '0';
        }
        return (confirmAmount / 100).toStringAsFixed(2);
    }

    MyUser.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        token = json['token'];
        isNewUser = json['is_new_user'];
        nickname = json['nickname'];
        avator = json['avator'];
        wechatId = json['wechat_id'];
        specialId = json['special_id'];
        relationId = json['relation_id'];
        taobaoUserNick = json['taobao_user_nick'];
        level = json['level'];
        inviteCode = json['invite_code'];
        amount = json['amount'];
        totalAmount = json['total_amount'];
        createAmount = json['create_amount'];
        confirmAmount = json['confirm_amount'];
        friendAmount = json['friend_amount'];
        friendTotalAmount = json['friend_total_amount'];
        friendCreateAmount = json['friend_create_amount'];
        friendConfirmAmount = json['friend_confirm_amount'];
        todayTotalAmount = json['today_total_amount'];
        monthTotalAmount = json['month_total_amount'];
        friendCount = json['friend_count'];
        friendFriendCount = json['friend_friend_count'];
        mentorId = json['mentor_id'];
        mentorName = json['mentor_name'];
        mentorWechatId = json['mentor_wechat_id'];
        createAt = json['create_at'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['token'] = this.token;
        data['is_new_user'] = this.isNewUser;
        data['nickname'] = this.nickname;
        data['avator'] = this.avator;
        data['wechat_id'] = this.wechatId;
        data['special_id'] = this.specialId;
        data['relation_id'] = this.relationId;
        data['taobao_user_nick'] = this.taobaoUserNick;
        data['level'] = this.level;
        data['invite_code'] = this.inviteCode;
        data['amount'] = this.amount;
        data['total_amount'] = this.totalAmount;
        data['create_amount'] = this.createAmount;
        data['confirm_amount'] = this.confirmAmount;
        data['friend_amount'] = this.friendAmount;
        data['friend_total_amount'] = this.friendTotalAmount;
        data['friend_create_amount'] = this.friendCreateAmount;
        data['friend_confirm_amount'] = this.friendConfirmAmount;
        data['today_total_amount'] = this.todayTotalAmount;
        data['month_total_amount'] = this.monthTotalAmount;
        data['friend_count'] = this.friendCount;
        data['friend_friend_count'] = this.friendFriendCount;
        data['mentor_id'] = this.mentorId;
        data['mentor_name'] = this.mentorName;
        data['mentor_wechat_id'] = this.mentorWechatId;
        data['create_at'] = this.createAt;
        return data;
    }
}
