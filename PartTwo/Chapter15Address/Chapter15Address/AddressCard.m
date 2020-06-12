//
//  AddressCard.m
//  Chapter15Address
//
//  Created by 关智豪 on 2020/6/11.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

@synthesize name,email;

- (void) setName:(NSString *)theName andEmail:(NSString *)theEmail
{
    self.name=theName;
    self.email=theEmail;
}

- (NSComparisonResult)compareName:(id)element
{
    return [name compare:[element name]];
}

- (void)print
{
    NSLog(@"%-31s",[name UTF8String]);
    NSLog(@"%-31s",[email UTF8String]);
}

- (id)copyWithZone:(NSZone *)zone
{
    id newCard = [[[self class]allocWithZone:zone]init];
    [newCard setName:name andEmail:email];
    return newCard;
}

- (void)assignName:(NSString *)theName andEmail:(NSString *)theEmail
{
    name=theName;
    email=theEmail;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:name forKey:@"AddressCardName"];
    [coder encodeObject:email forKey:@"AddressCardEmail"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    name = [coder decodeObjectForKey:@"AddressCardName"];
    email = [coder decodeObjectForKey:@"AddressCardEmail"];
    
    return self;
}


@end
