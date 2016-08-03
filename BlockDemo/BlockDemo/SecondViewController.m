//
//  SecondViewController.m
//  BlockDemo
//
//  Created by 马文帅 on 16/5/31.
//  Copyright © 2016年 ekeguan. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)done:(id)sender {
    if (_block) {
        _block(self.textField.text, self.textField.text);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    id __weak obj0 = nil;
    if (YES) {
        id obj1 = [[NSObject alloc] init];
        obj0 = obj1;
        NSLog(@"obj0 = %@", obj0);
    }
    NSLog(@"obj0 = %@", obj0);
}

@end
