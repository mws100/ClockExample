//
//  ViewController.m
//  BlockDemo
//
//  Created by 马文帅 on 16/5/31.
//  Copyright © 2016年 ekeguan. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)next:(UIButton *)sender {
    SecondViewController *vc = [[SecondViewController alloc] init];
    __weak typeof(self) weakSelf = self;
    vc.block = ^(NSString *text, NSString *text2){
        weakSelf.label.text = [text stringByAppendingString:text2];
    };
    [self presentViewController:vc animated:YES completion:nil];
}

@end
