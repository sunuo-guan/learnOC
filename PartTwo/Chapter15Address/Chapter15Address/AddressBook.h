//
//  AddressBook.h
//  Chapter15Address
//
//  Created by 关智豪 on 2020/6/11.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressBook : NSObject<NSCopying,NSCoding>

@property (nonatomic, copy)NSString *bookName;
@property (nonatomic, strong)NSMutableArray *book;

- (id)initWithName:(NSString *)name;
- (void)sort;
- (void)sort2;
- (void)addCard:(AddressCard *)theCard;
- (void)removeCard:(AddressCard *)theCard;
- (int)entries;
- (void)list;
- (AddressCard *)lookup:(NSString *)theName;

@end

NS_ASSUME_NONNULL_END
