//
//  ZWUserInfoModel.m
//  TakeYouFly
//
//  Created by zhangwei on 17/6/19.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWUserInfoModel.h"
//NSString *const kRootClassCreateTime = @"create_time";
//NSString *const kRootClassHeadImg = @"head_img";
//NSString *const kRootClassIdField = @"id";
//NSString *const kRootClassNickName = @"nick_name";
//NSString *const kRootClassOpenId = @"open_id";
//NSString *const kRootClassType = @"type";
//NSString *const kRootClassUpdateTime = @"update_time";

@implementation ZWUserInfoModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"userId" : @"id"
             };
}
//-(instancetype)initWithDictionary:(NSDictionary *)dictionary
//{
//    self = [super init];
//    if(![dictionary[kRootClassCreateTime] isKindOfClass:[NSNull class]]){
//        self.createTime = dictionary[kRootClassCreateTime];
//    }
//    if(![dictionary[kRootClassHeadImg] isKindOfClass:[NSNull class]]){
//        self.headImg = dictionary[kRootClassHeadImg];
//    }
//    if(![dictionary[kRootClassIdField] isKindOfClass:[NSNull class]]){
//        self.idField = [dictionary[kRootClassIdField] integerValue];
//    }
//    
//    if(![dictionary[kRootClassNickName] isKindOfClass:[NSNull class]]){
//        self.nickName = dictionary[kRootClassNickName];
//    }
//    if(![dictionary[kRootClassOpenId] isKindOfClass:[NSNull class]]){
//        self.openId = dictionary[kRootClassOpenId];
//    }
//    if(![dictionary[kRootClassType] isKindOfClass:[NSNull class]]){
//        self.type = [dictionary[kRootClassType] integerValue];
//    }
//    
//    if(![dictionary[kRootClassUpdateTime] isKindOfClass:[NSNull class]]){
//        self.updateTime = dictionary[kRootClassUpdateTime];
//    }
//    return self;
//}
//
//
///**
// * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
// */
//-(NSDictionary *)toDictionary
//{
//    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
//    if(self.createTime != nil){
//        dictionary[kRootClassCreateTime] = self.createTime;
//    }
//    if(self.headImg != nil){
//        dictionary[kRootClassHeadImg] = self.headImg;
//    }
//    dictionary[kRootClassIdField] = @(self.idField);
//    if(self.nickName != nil){
//        dictionary[kRootClassNickName] = self.nickName;
//    }
//    if(self.openId != nil){
//        dictionary[kRootClassOpenId] = self.openId;
//    }
//    dictionary[kRootClassType] = @(self.type);
//    if(self.updateTime != nil){
//        dictionary[kRootClassUpdateTime] = self.updateTime;
//    }
//    return dictionary;
//    
//}
//
///**
// * Implementation of NSCoding encoding method
// */
///**
// * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
// */
//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    if(self.createTime != nil){
//        [aCoder encodeObject:self.createTime forKey:kRootClassCreateTime];
//    }
//    if(self.headImg != nil){
//        [aCoder encodeObject:self.headImg forKey:kRootClassHeadImg];
//    }
//    [aCoder encodeObject:@(self.idField) forKey:kRootClassIdField];	if(self.nickName != nil){
//        [aCoder encodeObject:self.nickName forKey:kRootClassNickName];
//    }
//    if(self.openId != nil){
//        [aCoder encodeObject:self.openId forKey:kRootClassOpenId];
//    }
//    [aCoder encodeObject:@(self.type) forKey:kRootClassType];	if(self.updateTime != nil){
//        [aCoder encodeObject:self.updateTime forKey:kRootClassUpdateTime];
//    }
//    
//}
//
///**
// * Implementation of NSCoding initWithCoder: method
// */
//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super init];
//    self.createTime = [aDecoder decodeObjectForKey:kRootClassCreateTime];
//    self.headImg = [aDecoder decodeObjectForKey:kRootClassHeadImg];
//    self.idField = [[aDecoder decodeObjectForKey:kRootClassIdField] integerValue];
//    self.nickName = [aDecoder decodeObjectForKey:kRootClassNickName];
//    self.openId = [aDecoder decodeObjectForKey:kRootClassOpenId];
//    self.type = [[aDecoder decodeObjectForKey:kRootClassType] integerValue];
//    self.updateTime = [aDecoder decodeObjectForKey:kRootClassUpdateTime];
//    return self;
//    
//}
//
///**
// * Implementation of NSCopying copyWithZone: method
// */
//- (instancetype)copyWithZone:(NSZone *)zone
//{
//    ZWUserInfoModel *copy = [ZWUserInfoModel new];
//    
//    copy.createTime = [self.createTime copy];
//    copy.headImg = [self.headImg copy];
//    copy.idField = self.idField;
//    copy.nickName = [self.nickName copy];
//    copy.openId = [self.openId copy];
//    copy.type = self.type;
//    copy.updateTime = [self.updateTime copy];
//    
//    return copy;
//}

@end
