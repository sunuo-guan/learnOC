//
//  AddressCard.h
//  Chapter15Address
//
//  Created by 关智豪 on 2020/6/11.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressCard : NSObject <NSCoding, NSCopying>

@property (nonatomic, copy) NSString *name, *email;

- (void)setName:(NSString *)theName andEmail:(NSString *)theEmail;
- (void)assignName:(NSString *)theName andEmail:(NSString *)theEmail;
- (NSComparisonResult) compareName:(id)element;

-(void)print;

@end

NS_ASSUME_NONNULL_END
