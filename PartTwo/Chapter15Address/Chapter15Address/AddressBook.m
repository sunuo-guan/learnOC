//
//  AddressBook.m
//  Chapter15Address
//
//  Created by 关智豪 on 2020/6/11.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

@synthesize bookName,book;

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    
    if(self) {
        bookName = [NSString stringWithString:name];
        book = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"unnamed book"];
}

//编写地址簿设置方法，以创建一个可变副本
- (void)setBook:(NSArray *)theBook
{
    book = [theBook mutableCopy];
}

//?
- (void)sort
{
    [book sortUsingSelector:@selector(compareName:)];
}

//使用区块取代sort方法，比较器
- (void)sort2
{
    [book sortUsingComparator:
     ^(id obj1,id obj2) {
        return [[obj1 name] compare:[obj2 name]];
    }];
}

- (void)addCard:(AddressCard *)theCard
{
    [book addObject:theCard];
}

- (void)removeCard:(AddressCard *)theCard
{
    [book removeObjectIdenticalTo:theCard];
}

- (int)entries
{
    return [book count];
}

- (void)list
{
    NSLog(@"Contents of %@",bookName);
    for (AddressCard *theCard in book)
        NSLog(@"%-20s     %-32s",[theCard.name UTF8String],[theCard.email UTF8String]);
}

//通过名字查找地址
- (AddressCard *)lookup:(NSString *)theName
{
    for(AddressCard *theCard in book)
        if([[theCard name] caseInsensitiveCompare:theName]==NSOrderedSame)
            return theCard;
    
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:bookName forKey:@"AddressBookName"];
    [coder encodeObject:book forKey:@"AddressBookBook"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    bookName = [coder decodeObjectForKey:@"AddressBookName"];
    book = [coder decodeObjectForKey:@"AddressBookBook"];
    return self;
}

-(id)copyWithZone:(NSZone *)zone
{
    id newBook = [[[self class]allocWithZone:zone]init];
    [newBook setBookName:bookName];
    [newBook setBook:book];
    return newBook;
}

@end
