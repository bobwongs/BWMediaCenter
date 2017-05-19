//
//  BWBaseViewController.m
//  BWiOSProjectFramework
//
//  Created by BobWong on 16/12/1.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWBaseViewController.h"

@interface BWBaseViewController ()

@end

@implementation BWBaseViewController

#pragma mark - Life Cycle

- (void)dealloc {
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

@end
