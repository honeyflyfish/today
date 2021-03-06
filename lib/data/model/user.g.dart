// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map json) {
  return UserInfo(
    json['username'] as String,
    json['screenName'] as String,
    json['createdAt'] as String,
    json['isVerified'] as bool ?? false,
    json['verifyMessage'] as String ?? '',
    json['profileImageUrl'] as String ?? '',
    json['avatarImage'] == null
        ? null
        : UserAvatar.fromJson(json['avatarImage'] as Map),
    (json['trailingIcons'] as List)
            ?.map((e) => e == null ? null : TrailingIcons.fromJson(e as Map))
            ?.toList() ??
        [],
    json['statsCount'] == null
        ? null
        : StatsCount.fromJson(json['statsCount'] as Map),
    json['backgroundImage'] == null
        ? null
        : Picture.fromJson(json['backgroundImage'] as Map),
    json['id'] as String,
    json['preferences'] == null
        ? null
        : Preferences.fromJson(json['preferences'] as Map),
    json['isBetaUser'] as bool,
    json['usernameSet'] as bool,
    json['isLoginUser'] as bool,
    json['profileVisitDescription'] as String,
    json['briefIntro'] as String,
    json['bio'] as String,
    (json['enabledFeatures'] as List)?.map((e) => e as String)?.toList(),
    json['gender'] as String ?? '',
    json['zodiac'] as String ?? '',
    json['industry'] as String ?? '',
    json['city'] as String ?? '',
    json['country'] as String ?? '',
    json['province'] as String ?? '',
    json['ref'] as String ?? '',
    (json['profileTags'] as List)
            ?.map((e) => e == null ? null : TrailingIcons.fromJson(e as Map))
            ?.toList() ??
        [],
    (json['medals'] as List)
            ?.map((e) => e == null ? null : Medals.fromJson(e as Map))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'username': instance.username,
      'screenName': instance.screenName,
      'createdAt': instance.createdAt,
      'isVerified': instance.isVerified,
      'verifyMessage': instance.verifyMessage,
      'profileImageUrl': instance.profileImageUrl,
      'avatarImage': instance.avatarImage,
      'trailingIcons': instance.trailingIcons,
      'statsCount': instance.statsCount,
      'backgroundImage': instance.backgroundImage,
      'id': instance.id,
      'preferences': instance.preferences,
      'isBetaUser': instance.isBetaUser,
      'usernameSet': instance.usernameSet,
      'isLoginUser': instance.isLoginUser,
      'profileVisitDescription': instance.profileVisitDescription,
      'briefIntro': instance.briefIntro,
      'bio': instance.bio,
      'enabledFeatures': instance.enabledFeatures,
      'gender': instance.gender,
      'zodiac': instance.zodiac,
      'industry': instance.industry,
      'city': instance.city,
      'country': instance.country,
      'province': instance.province,
      'ref': instance.ref,
      'medals': instance.medals,
      'profileTags': instance.profileTags,
    };

UserAvatar _$UserAvatarFromJson(Map json) {
  return UserAvatar(
    thumbnailUrl: json['thumbnailUrl'] as String,
    smallPicUrl: json['smallPicUrl'] as String,
    picUrl: json['picUrl'] as String,
    format: json['format'] as String,
    badgeUrl: json['badgeUrl'] as String,
  );
}

Map<String, dynamic> _$UserAvatarToJson(UserAvatar instance) =>
    <String, dynamic>{
      'thumbnailUrl': instance.thumbnailUrl,
      'smallPicUrl': instance.smallPicUrl,
      'picUrl': instance.picUrl,
      'format': instance.format,
      'badgeUrl': instance.badgeUrl,
    };

StatsCount _$StatsCountFromJson(Map json) {
  return StatsCount(
    topicSubscribed: json['topicSubscribed'] as int ?? 0,
    topicCreated: json['topicCreated'] as int ?? 0,
    followedCount: json['followedCount'] as int ?? 0,
    followingCount: json['followingCount'] as int ?? 0,
    highlightedPersonalUpdates: json['highlightedPersonalUpdates'] as int ?? 0,
    liked: json['liked'] as int ?? 0,
  );
}

Map<String, dynamic> _$StatsCountToJson(StatsCount instance) =>
    <String, dynamic>{
      'topicSubscribed': instance.topicSubscribed,
      'topicCreated': instance.topicCreated,
      'followedCount': instance.followedCount,
      'followingCount': instance.followingCount,
      'highlightedPersonalUpdates': instance.highlightedPersonalUpdates,
      'liked': instance.liked,
    };

Preferences _$PreferencesFromJson(Map json) {
  return Preferences(
    autoPlayVideo: json['autoPlayVideo'] as bool,
    topicTagGuideOn: json['topicTagGuideOn'] as bool,
    dailyNotificationOn: json['dailyNotificationOn'] as bool,
    followedNotificationOn: json['followedNotificationOn'] as bool,
    subscribeWeatherForecast: json['subscribeWeatherForecast'] as bool,
    privateTopicSubscribe: json['privateTopicSubscribe'] as bool,
    undiscoverableByPhoneNumber: json['undiscoverableByPhoneNumber'] as bool,
    saveDataUsageMode: json['saveDataUsageMode'] as bool,
    topicPushSettings: json['topicPushSettings'] as String,
    debugLogOn: json['debugLogOn'] as bool,
    env: json['env'] as String,
    syncCommentToPersonalActivity:
        json['syncCommentToPersonalActivity'] as bool,
    repostWithComment: json['repostWithComment'] as bool,
    enablePrivateChat: json['enablePrivateChat'] as bool,
    blockStrangerPoke: json['blockStrangerPoke'] as bool,
    enablePictureWatermark: json['enablePictureWatermark'] as bool,
    enableOperationPush: json['enableOperationPush'] as bool,
    enableChatSound: json['enableChatSound'] as bool,
    openMessageTabOnLaunch: json['openMessageTabOnLaunch'] as bool,
    tabOnLaunch: json['tabOnLaunch'] as String,
    hideSubscribeTab: json['hideSubscribeTab'] as bool,
  );
}

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'autoPlayVideo': instance.autoPlayVideo,
      'topicTagGuideOn': instance.topicTagGuideOn,
      'dailyNotificationOn': instance.dailyNotificationOn,
      'followedNotificationOn': instance.followedNotificationOn,
      'subscribeWeatherForecast': instance.subscribeWeatherForecast,
      'privateTopicSubscribe': instance.privateTopicSubscribe,
      'undiscoverableByPhoneNumber': instance.undiscoverableByPhoneNumber,
      'saveDataUsageMode': instance.saveDataUsageMode,
      'topicPushSettings': instance.topicPushSettings,
      'debugLogOn': instance.debugLogOn,
      'env': instance.env,
      'syncCommentToPersonalActivity': instance.syncCommentToPersonalActivity,
      'repostWithComment': instance.repostWithComment,
      'enablePrivateChat': instance.enablePrivateChat,
      'blockStrangerPoke': instance.blockStrangerPoke,
      'enablePictureWatermark': instance.enablePictureWatermark,
      'enableOperationPush': instance.enableOperationPush,
      'enableChatSound': instance.enableChatSound,
      'openMessageTabOnLaunch': instance.openMessageTabOnLaunch,
      'tabOnLaunch': instance.tabOnLaunch,
      'hideSubscribeTab': instance.hideSubscribeTab,
    };

Background _$BackgroundFromJson(Map json) {
  return Background(
    json['picUrl'] as String,
  );
}

Map<String, dynamic> _$BackgroundToJson(Background instance) =>
    <String, dynamic>{
      'picUrl': instance.picUrl,
    };

TrailingIcons _$TrailingIconsFromJson(Map json) {
  return TrailingIcons(
    json['url'] as String ?? '',
    json['picUrl'] as String ?? '',
    json['text'] as String ?? '',
    json['type'] as String,
  );
}

Map<String, dynamic> _$TrailingIconsToJson(TrailingIcons instance) =>
    <String, dynamic>{
      'url': instance.url,
      'picUrl': instance.picUrl,
      'text': instance.text,
      'type': instance.type,
    };

Medals _$MedalsFromJson(Map json) {
  return Medals(
    json['picUrl'] as String ?? '',
    json['url'] as String ?? '',
    json['name'] as String ?? '',
    json['gotMedalAt'] as String ?? '',
  );
}

Map<String, dynamic> _$MedalsToJson(Medals instance) => <String, dynamic>{
      'picUrl': instance.picUrl,
      'url': instance.url,
      'name': instance.name,
      'gotMedalAt': instance.gotMedalAt,
    };
