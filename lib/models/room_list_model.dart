import 'dart:convert';

RoomListModel roomListModelFromJson(String str) => RoomListModel.fromJson(json.decode(str));

String roomListModelToJson(RoomListModel data) => json.encode(data.toJson());

class RoomListModel {
  String? typename;
  RoomListModelSummary? summary;
  PropertyGallery? propertyGallery;
  ReviewInfo? reviewInfo;
  PropertyContentSectionGroups? propertyContentSectionGroups;

  RoomListModel({
    this.typename,
    this.summary,
    this.propertyGallery,
    this.reviewInfo,
    this.propertyContentSectionGroups,
  });

  factory RoomListModel.fromJson(Map<String, dynamic> json) => RoomListModel(
    typename: json["__typename"],
    summary: json["summary"] == null ? null : RoomListModelSummary.fromJson(json["summary"]),
    propertyGallery: json["propertyGallery"] == null ? null : PropertyGallery.fromJson(json["propertyGallery"]),
    reviewInfo: json["reviewInfo"] == null ? null : ReviewInfo.fromJson(json["reviewInfo"]),
    propertyContentSectionGroups: json["propertyContentSectionGroups"] == null ? null : PropertyContentSectionGroups.fromJson(json["propertyContentSectionGroups"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "summary": summary?.toJson(),
    "propertyGallery": propertyGallery?.toJson(),
    "reviewInfo": reviewInfo?.toJson(),
    "propertyContentSectionGroups": propertyContentSectionGroups?.toJson(),
  };
}

class PropertyContentSectionGroups {
  String? typename;
  dynamic cleanliness;

  PropertyContentSectionGroups({
    this.typename,
    this.cleanliness,
  });

  factory PropertyContentSectionGroups.fromJson(Map<String, dynamic> json) => PropertyContentSectionGroups(
    typename: json["__typename"],
    cleanliness: json["cleanliness"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "cleanliness": cleanliness,
  };
}

class PropertyGallery {
  String? typename;
  dynamic imagesGrouped;
  List<ImageElement>? images;
  String? accessibilityLabel;
  Dialog? thumbnailGalleryDialog;
  Dialog? mediaGalleryDialog;

  PropertyGallery({
    this.typename,
    this.imagesGrouped,
    this.images,
    this.accessibilityLabel,
    this.thumbnailGalleryDialog,
    this.mediaGalleryDialog,
  });

  factory PropertyGallery.fromJson(Map<String, dynamic> json) => PropertyGallery(
    typename: json["__typename"],
    imagesGrouped: json["imagesGrouped"],
    images: json["images"] == null ? [] : List<ImageElement>.from(json["images"]!.map((x) => ImageElement.fromJson(x))),
    accessibilityLabel: json["accessibilityLabel"],
    thumbnailGalleryDialog: json["thumbnailGalleryDialog"] == null ? null : Dialog.fromJson(json["thumbnailGalleryDialog"]),
    mediaGalleryDialog: json["mediaGalleryDialog"] == null ? null : Dialog.fromJson(json["mediaGalleryDialog"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "imagesGrouped": imagesGrouped,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "accessibilityLabel": accessibilityLabel,
    "thumbnailGalleryDialog": thumbnailGalleryDialog?.toJson(),
    "mediaGalleryDialog": mediaGalleryDialog?.toJson(),
  };
}

class ImageElement {
  PurpleTypename? typename;
  String? accessibilityText;
  ActionLabel? actionLabel;
  String? imageId;
  StaticImageClass? image;

  ImageElement({
    this.typename,
    this.accessibilityText,
    this.actionLabel,
    this.imageId,
    this.image,
  });

  factory ImageElement.fromJson(Map<String, dynamic> json) => ImageElement(
    typename: purpleTypenameValues.map[json["__typename"]]!,
    accessibilityText: json["accessibilityText"],
    actionLabel: actionLabelValues.map[json["actionLabel"]]!,
    imageId: json["imageId"],
    image: json["image"] == null ? null : StaticImageClass.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": purpleTypenameValues.reverse[typename],
    "accessibilityText": accessibilityText,
    "actionLabel": actionLabelValues.reverse[actionLabel],
    "imageId": imageId,
    "image": image?.toJson(),
  };
}

enum ActionLabel {
  MOSTRAR_EN_PANTALLA_COMPLETA
}

final actionLabelValues = EnumValues({
  "Mostrar en pantalla completa": ActionLabel.MOSTRAR_EN_PANTALLA_COMPLETA
});

class StaticImageClass {
  StaticImageTypename? typename;
  String? url;
  String? description;
  dynamic aspectRatio;

  StaticImageClass({
    this.typename,
    this.url,
    this.description,
    this.aspectRatio,
  });

  factory StaticImageClass.fromJson(Map<String, dynamic> json) => StaticImageClass(
    typename: staticImageTypenameValues.map[json["__typename"]]!,
    url: json["url"],
    description: json["description"],
    aspectRatio: json["aspectRatio"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": staticImageTypenameValues.reverse[typename],
    "url": url,
    "description": description,
    "aspectRatio": aspectRatio,
  };
}

enum StaticImageTypename {
  IMAGE
}

final staticImageTypenameValues = EnumValues({
  "Image": StaticImageTypename.IMAGE
});

enum PurpleTypename {
  PROPERTY_IMAGE
}

final purpleTypenameValues = EnumValues({
  "PropertyImage": PurpleTypename.PROPERTY_IMAGE
});

class Dialog {
  String? typename;
  TriggerClass? trigger;
  TriggerClass? toolbar;

  Dialog({
    this.typename,
    this.trigger,
    this.toolbar,
  });

  factory Dialog.fromJson(Map<String, dynamic> json) => Dialog(
    typename: json["__typename"],
    trigger: json["trigger"] == null ? null : TriggerClass.fromJson(json["trigger"]),
    toolbar: json["toolbar"] == null ? null : TriggerClass.fromJson(json["toolbar"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "trigger": trigger?.toJson(),
    "toolbar": toolbar?.toJson(),
  };
}

class TriggerClass {
  String? typename;
  String? title;
  Icon? icon;
  ClientSideAnalytics? clientSideAnalytics;
  String? value;

  TriggerClass({
    this.typename,
    this.title,
    this.icon,
    this.clientSideAnalytics,
    this.value,
  });

  factory TriggerClass.fromJson(Map<String, dynamic> json) => TriggerClass(
    typename: json["__typename"],
    title: json["title"],
    icon: json["icon"] == null ? null : Icon.fromJson(json["icon"]),
    clientSideAnalytics: json["clientSideAnalytics"] == null ? null : ClientSideAnalytics.fromJson(json["clientSideAnalytics"]),
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "title": title,
    "icon": icon?.toJson(),
    "clientSideAnalytics": clientSideAnalytics?.toJson(),
    "value": value,
  };
}

class ClientSideAnalytics {
  String? typename;
  String? linkName;
  String? referrerId;

  ClientSideAnalytics({
    this.typename,
    this.linkName,
    this.referrerId,
  });

  factory ClientSideAnalytics.fromJson(Map<String, dynamic> json) => ClientSideAnalytics(
    typename: json["__typename"],
    linkName: json["linkName"],
    referrerId: json["referrerId"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "linkName": linkName,
    "referrerId": referrerId,
  };
}

class Icon {
  IconTypename? typename;
  String? id;
  String? description;
  dynamic size;
  String? token;
  dynamic theme;

  Icon({
    this.typename,
    this.id,
    this.description,
    this.size,
    this.token,
    this.theme,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
    typename: iconTypenameValues.map[json["__typename"]]!,
    id: json["id"],
    description: json["description"],
    size: json["size"],
    token: json["token"],
    theme: json["theme"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": iconTypenameValues.reverse[typename],
    "id": id,
    "description": description,
    "size": size,
    "token": token,
    "theme": theme,
  };
}

enum IconTypename {
  ICON
}

final iconTypenameValues = EnumValues({
  "Icon": IconTypename.ICON
});

class ReviewInfo {
  String? typename;
  ReviewInfoSummary? summary;

  ReviewInfo({
    this.typename,
    this.summary,
  });

  factory ReviewInfo.fromJson(Map<String, dynamic> json) => ReviewInfo(
    typename: json["__typename"],
    summary: json["summary"] == null ? null : ReviewInfoSummary.fromJson(json["summary"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "summary": summary?.toJson(),
  };
}

class ReviewInfoSummary {
  String? typename;
  OverallScoreWithDescriptionA11Y? overallScoreWithDescriptionA11Y;
  PropertyReviewCountDetails? propertyReviewCountDetails;
  dynamic highlightMessage;
  SeeAllAction? seeAllAction;

  ReviewInfoSummary({
    this.typename,
    this.overallScoreWithDescriptionA11Y,
    this.propertyReviewCountDetails,
    this.highlightMessage,
    this.seeAllAction,
  });

  factory ReviewInfoSummary.fromJson(Map<String, dynamic> json) => ReviewInfoSummary(
    typename: json["__typename"],
    overallScoreWithDescriptionA11Y: json["overallScoreWithDescriptionA11y"] == null ? null : OverallScoreWithDescriptionA11Y.fromJson(json["overallScoreWithDescriptionA11y"]),
    propertyReviewCountDetails: json["propertyReviewCountDetails"] == null ? null : PropertyReviewCountDetails.fromJson(json["propertyReviewCountDetails"]),
    highlightMessage: json["highlightMessage"],
    seeAllAction: json["seeAllAction"] == null ? null : SeeAllAction.fromJson(json["seeAllAction"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "overallScoreWithDescriptionA11y": overallScoreWithDescriptionA11Y?.toJson(),
    "propertyReviewCountDetails": propertyReviewCountDetails?.toJson(),
    "highlightMessage": highlightMessage,
    "seeAllAction": seeAllAction?.toJson(),
  };
}

class OverallScoreWithDescriptionA11Y {
  String? typename;
  String? value;

  OverallScoreWithDescriptionA11Y({
    this.typename,
    this.value,
  });

  factory OverallScoreWithDescriptionA11Y.fromJson(Map<String, dynamic> json) => OverallScoreWithDescriptionA11Y(
    typename: json["__typename"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "value": value,
  };
}

class PropertyReviewCountDetails {
  String? typename;
  String? shortDescription;

  PropertyReviewCountDetails({
    this.typename,
    this.shortDescription,
  });

  factory PropertyReviewCountDetails.fromJson(Map<String, dynamic> json) => PropertyReviewCountDetails(
    typename: json["__typename"],
    shortDescription: json["shortDescription"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "shortDescription": shortDescription,
  };
}

class SeeAllAction {
  String? typename;
  Trigger? trigger;

  SeeAllAction({
    this.typename,
    this.trigger,
  });

  factory SeeAllAction.fromJson(Map<String, dynamic> json) => SeeAllAction(
    typename: json["__typename"],
    trigger: json["trigger"] == null ? null : Trigger.fromJson(json["trigger"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "trigger": trigger?.toJson(),
  };
}

class Trigger {
  String? typename;
  ClientSideAnalytics? clientSideAnalytics;

  Trigger({
    this.typename,
    this.clientSideAnalytics,
  });

  factory Trigger.fromJson(Map<String, dynamic> json) => Trigger(
    typename: json["__typename"],
    clientSideAnalytics: json["clientSideAnalytics"] == null ? null : ClientSideAnalytics.fromJson(json["clientSideAnalytics"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "clientSideAnalytics": clientSideAnalytics?.toJson(),
  };
}

class RoomListModelSummary {
  String? typename;
  dynamic bannerMessage;
  String? id;
  String? name;
  String? latinAlphabetName;
  String? tagline;
  StarRatingIcon? starRatingIcon;
  Overview? overview;
  dynamic featuredMessages;
  dynamic spaceOverview;
  Amenities? amenities;
  dynamic cleaningAndSafety;
  Location? location;
  NearbyPoIs? nearbyPoIs;
  dynamic lodgingChatbot;

  RoomListModelSummary({
    this.typename,
    this.bannerMessage,
    this.id,
    this.name,
    this.latinAlphabetName,
    this.tagline,
    this.starRatingIcon,
    this.overview,
    this.featuredMessages,
    this.spaceOverview,
    this.amenities,
    this.cleaningAndSafety,
    this.location,
    this.nearbyPoIs,
    this.lodgingChatbot,
  });

  factory RoomListModelSummary.fromJson(Map<String, dynamic> json) => RoomListModelSummary(
    typename: json["__typename"],
    bannerMessage: json["bannerMessage"],
    id: json["id"],
    name: json["name"],
    latinAlphabetName: json["latinAlphabetName"],
    tagline: json["tagline"],
    starRatingIcon: json["starRatingIcon"] == null ? null : StarRatingIcon.fromJson(json["starRatingIcon"]),
    overview: json["overview"] == null ? null : Overview.fromJson(json["overview"]),
    featuredMessages: json["featuredMessages"],
    spaceOverview: json["spaceOverview"],
    amenities: json["amenities"] == null ? null : Amenities.fromJson(json["amenities"]),
    cleaningAndSafety: json["cleaningAndSafety"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    nearbyPoIs: json["nearbyPOIs"] == null ? null : NearbyPoIs.fromJson(json["nearbyPOIs"]),
    lodgingChatbot: json["lodgingChatbot"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "bannerMessage": bannerMessage,
    "id": id,
    "name": name,
    "latinAlphabetName": latinAlphabetName,
    "tagline": tagline,
    "starRatingIcon": starRatingIcon?.toJson(),
    "overview": overview?.toJson(),
    "featuredMessages": featuredMessages,
    "spaceOverview": spaceOverview,
    "amenities": amenities?.toJson(),
    "cleaningAndSafety": cleaningAndSafety,
    "location": location?.toJson(),
    "nearbyPOIs": nearbyPoIs?.toJson(),
    "lodgingChatbot": lodgingChatbot,
  };
}

class Amenities {
  String? typename;
  NearbyPoIs? topAmenities;
  dynamic propertyContentPreferences;
  AmenitiesDialog? amenitiesDialog;
  Takeover? takeover;

  Amenities({
    this.typename,
    this.topAmenities,
    this.propertyContentPreferences,
    this.amenitiesDialog,
    this.takeover,
  });

  factory Amenities.fromJson(Map<String, dynamic> json) => Amenities(
    typename: json["__typename"],
    topAmenities: json["topAmenities"] == null ? null : NearbyPoIs.fromJson(json["topAmenities"]),
    propertyContentPreferences: json["propertyContentPreferences"],
    amenitiesDialog: json["amenitiesDialog"] == null ? null : AmenitiesDialog.fromJson(json["amenitiesDialog"]),
    takeover: json["takeover"] == null ? null : Takeover.fromJson(json["takeover"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "topAmenities": topAmenities?.toJson(),
    "propertyContentPreferences": propertyContentPreferences,
    "amenitiesDialog": amenitiesDialog?.toJson(),
    "takeover": takeover?.toJson(),
  };
}

class AmenitiesDialog {
  String? typename;
  TriggerClass? trigger;
  PurpleToolbar? toolbar;

  AmenitiesDialog({
    this.typename,
    this.trigger,
    this.toolbar,
  });

  factory AmenitiesDialog.fromJson(Map<String, dynamic> json) => AmenitiesDialog(
    typename: json["__typename"],
    trigger: json["trigger"] == null ? null : TriggerClass.fromJson(json["trigger"]),
    toolbar: json["toolbar"] == null ? null : PurpleToolbar.fromJson(json["toolbar"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "trigger": trigger?.toJson(),
    "toolbar": toolbar?.toJson(),
  };
}

class PurpleToolbar {
  String? typename;
  String? title;

  PurpleToolbar({
    this.typename,
    this.title,
  });

  factory PurpleToolbar.fromJson(Map<String, dynamic> json) => PurpleToolbar(
    typename: json["__typename"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "title": title,
  };
}

class Takeover {
  String? typename;
  dynamic amenityClosures;
  List<NearbyPoIs>? highlight;
  List<NearbyPoIs>? property;

  Takeover({
    this.typename,
    this.amenityClosures,
    this.highlight,
    this.property,
  });

  factory Takeover.fromJson(Map<String, dynamic> json) => Takeover(
    typename: json["__typename"],
    amenityClosures: json["amenityClosures"],
    highlight: json["highlight"] == null ? [] : List<NearbyPoIs>.from(json["highlight"]!.map((x) => NearbyPoIs.fromJson(x))),
    property: json["property"] == null ? [] : List<NearbyPoIs>.from(json["property"]!.map((x) => NearbyPoIs.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "amenityClosures": amenityClosures,
    "highlight": highlight == null ? [] : List<dynamic>.from(highlight!.map((x) => x.toJson())),
    "property": property == null ? [] : List<dynamic>.from(property!.map((x) => x.toJson())),
  };
}

class NearbyPoIs {
  NearbyPoIsTypename? typename;
  Header? header;
  Icon? icon;
  dynamic jumpLink;
  List<Item>? items;

  NearbyPoIs({
    this.typename,
    this.header,
    this.icon,
    this.jumpLink,
    this.items,
  });

  factory NearbyPoIs.fromJson(Map<String, dynamic> json) => NearbyPoIs(
    typename: nearbyPoIsTypenameValues.map[json["__typename"]]!,
    header: json["header"] == null ? null : Header.fromJson(json["header"]),
    icon: json["icon"] == null ? null : Icon.fromJson(json["icon"]),
    jumpLink: json["jumpLink"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": nearbyPoIsTypenameValues.reverse[typename],
    "header": header?.toJson(),
    "icon": icon?.toJson(),
    "jumpLink": jumpLink,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Header {
  HeaderTypename? typename;
  String? text;
  dynamic subText;
  dynamic mark;

  Header({
    this.typename,
    this.text,
    this.subText,
    this.mark,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    typename: headerTypenameValues.map[json["__typename"]]!,
    text: json["text"],
    subText: json["subText"],
    mark: json["mark"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": headerTypenameValues.reverse[typename],
    "text": text,
    "subText": subText,
    "mark": mark,
  };
}

enum HeaderTypename {
  LODGING_HEADER
}

final headerTypenameValues = EnumValues({
  "LodgingHeader": HeaderTypename.LODGING_HEADER
});

class Item {
  ItemTypename? typename;
  String? text;
  dynamic state;
  String? moreInfo;
  Icon? icon;

  Item({
    this.typename,
    this.text,
    this.state,
    this.moreInfo,
    this.icon,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    typename: itemTypenameValues.map[json["__typename"]]!,
    text: json["text"],
    state: json["state"],
    moreInfo: json["moreInfo"],
    icon: json["icon"] == null ? null : Icon.fromJson(json["icon"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": itemTypenameValues.reverse[typename],
    "text": text,
    "state": state,
    "moreInfo": moreInfo,
    "icon": icon?.toJson(),
  };
}

enum ItemTypename {
  PROPERTY_INFO_ITEM
}

final itemTypenameValues = EnumValues({
  "PropertyInfoItem": ItemTypename.PROPERTY_INFO_ITEM
});

enum NearbyPoIsTypename {
  PROPERTY_INFO_CONTENT
}

final nearbyPoIsTypenameValues = EnumValues({
  "PropertyInfoContent": NearbyPoIsTypename.PROPERTY_INFO_CONTENT
});

class Location {
  String? typename;
  Address? address;
  Coordinates? coordinates;
  MultiCityRegion? multiCityRegion;
  WhatsAround? whatsAround;
  Dialog? mapDialog;
  StaticImageClass? staticImage;

  Location({
    this.typename,
    this.address,
    this.coordinates,
    this.multiCityRegion,
    this.whatsAround,
    this.mapDialog,
    this.staticImage,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    typename: json["__typename"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    multiCityRegion: json["multiCityRegion"] == null ? null : MultiCityRegion.fromJson(json["multiCityRegion"]),
    whatsAround: json["whatsAround"] == null ? null : WhatsAround.fromJson(json["whatsAround"]),
    mapDialog: json["mapDialog"] == null ? null : Dialog.fromJson(json["mapDialog"]),
    staticImage: json["staticImage"] == null ? null : StaticImageClass.fromJson(json["staticImage"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "address": address?.toJson(),
    "coordinates": coordinates?.toJson(),
    "multiCityRegion": multiCityRegion?.toJson(),
    "whatsAround": whatsAround?.toJson(),
    "mapDialog": mapDialog?.toJson(),
    "staticImage": staticImage?.toJson(),
  };
}

class Address {
  String? typename;
  String? addressLine;
  String? city;
  String? province;
  String? countryCode;
  String? firstAddressLine;
  String? secondAddressLine;

  Address({
    this.typename,
    this.addressLine,
    this.city,
    this.province,
    this.countryCode,
    this.firstAddressLine,
    this.secondAddressLine,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    typename: json["__typename"],
    addressLine: json["addressLine"],
    city: json["city"],
    province: json["province"],
    countryCode: json["countryCode"],
    firstAddressLine: json["firstAddressLine"],
    secondAddressLine: json["secondAddressLine"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "addressLine": addressLine,
    "city": city,
    "province": province,
    "countryCode": countryCode,
    "firstAddressLine": firstAddressLine,
    "secondAddressLine": secondAddressLine,
  };
}

class Coordinates {
  String? typename;
  double? latitude;
  double? longitude;

  Coordinates({
    this.typename,
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    typename: json["__typename"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class MultiCityRegion {
  String? typename;
  String? id;

  MultiCityRegion({
    this.typename,
    this.id,
  });

  factory MultiCityRegion.fromJson(Map<String, dynamic> json) => MultiCityRegion(
    typename: json["__typename"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "id": id,
  };
}

class WhatsAround {
  String? typename;
  Editorial? editorial;

  WhatsAround({
    this.typename,
    this.editorial,
  });

  factory WhatsAround.fromJson(Map<String, dynamic> json) => WhatsAround(
    typename: json["__typename"],
    editorial: json["editorial"] == null ? null : Editorial.fromJson(json["editorial"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "editorial": editorial?.toJson(),
  };
}

class Editorial {
  String? typename;
  String? title;
  List<String>? content;

  Editorial({
    this.typename,
    this.title,
    this.content,
  });

  factory Editorial.fromJson(Map<String, dynamic> json) => Editorial(
    typename: json["__typename"],
    title: json["title"],
    content: json["content"] == null ? [] : List<String>.from(json["content"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "title": title,
    "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x)),
  };
}

class Overview {
  String? typename;
  String? vipMessaging;
  dynamic inventoryType;
  String? accessibilityLabel;
  dynamic label;
  PropertyRating? propertyRating;

  Overview({
    this.typename,
    this.vipMessaging,
    this.inventoryType,
    this.accessibilityLabel,
    this.label,
    this.propertyRating,
  });

  factory Overview.fromJson(Map<String, dynamic> json) => Overview(
    typename: json["__typename"],
    vipMessaging: json["vipMessaging"],
    inventoryType: json["inventoryType"],
    accessibilityLabel: json["accessibilityLabel"],
    label: json["label"],
    propertyRating: json["propertyRating"] == null ? null : PropertyRating.fromJson(json["propertyRating"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "vipMessaging": vipMessaging,
    "inventoryType": inventoryType,
    "accessibilityLabel": accessibilityLabel,
    "label": label,
    "propertyRating": propertyRating?.toJson(),
  };
}

class PropertyRating {
  String? typename;
  int? rating;
  String? accessibility;
  Icon? icon;

  PropertyRating({
    this.typename,
    this.rating,
    this.accessibility,
    this.icon,
  });

  factory PropertyRating.fromJson(Map<String, dynamic> json) => PropertyRating(
    typename: json["__typename"],
    rating: json["rating"],
    accessibility: json["accessibility"],
    icon: json["icon"] == null ? null : Icon.fromJson(json["icon"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "rating": rating,
    "accessibility": accessibility,
    "icon": icon?.toJson(),
  };
}

class StarRatingIcon {
  IconTypename? typename;
  String? token;

  StarRatingIcon({
    this.typename,
    this.token,
  });

  factory StarRatingIcon.fromJson(Map<String, dynamic> json) => StarRatingIcon(
    typename: iconTypenameValues.map[json["__typename"]]!,
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": iconTypenameValues.reverse[typename],
    "token": token,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
