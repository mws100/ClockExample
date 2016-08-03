//
//  SecondViewController.h
//  BlockDemo
//
//  Created by 马文帅 on 16/5/31.
//  Copyright © 2016年 ekeguan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SecondVCBlock)(NSString *, NSString *);

@interface SecondViewController : UIViewController

@property (nonatomic, strong) SecondVCBlock block;


@end
