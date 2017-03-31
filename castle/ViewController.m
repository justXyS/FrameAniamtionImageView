//
//  ViewController.m
//  castle
//
//  Created by xiaoyuan on 2017/3/29.
//  Copyright © 2017年 xiaoyuan. All rights reserved.
//

#import "ViewController.h"
#import "DTCastleAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)begin:(id)sender {
    DTCastleAnimationView *view = [DTCastleAnimationView new];
    view.duration = 11750;
    view.position = @"bottom";
    
    NSMutableArray *temp = [NSMutableArray array];
    NSBundle *bundle = [NSBundle mainBundle];
    for (int i = 0; i< 94; i++) {
        [temp addObject:[bundle pathForResource:[NSString stringWithFormat:@"chengbao_000%02d.png",i] ofType:nil]];
    }
    view.imagePathss = temp;
    
    [self.view addSubview:view];
    [view begin];
}

@end
