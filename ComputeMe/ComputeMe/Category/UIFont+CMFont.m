//
// Created by Ryne Cheow on 5/27/14.
// Copyright (c) 2014 Pointwelve. All rights reserved.
//

#import "UIFont+CMFont.h"


@implementation UIFont (CMFont)

+ (instancetype)cocogooseFontWithSize:(CGFloat)size
{
   return [UIFont fontWithName:@"COCOGOOSE" size:size];
}

+ (instancetype)myriadProFontWithSize:(CGFloat)size
{
   return [UIFont fontWithName:@"Myriad Pro" size:size];
}

+ (instancetype)codeLightFontWithSize:(CGFloat)size
{
   return [UIFont fontWithName:@"CODE Light" size:size];
}

@end