//
//  GameTitleViewController.m
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//

#import "GameTitleViewController.h"
#import "GameBoardViewController.h"

@interface GameTitleViewController ()

@end

@implementation GameTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tappedGameStartButton:(id)sender
{
    
    GameBoardViewController *gbViewController;
    gbViewController = [[GameBoardViewController alloc]initWithNibName:@"GameBoardViewController" bundle:nil];
    [self presentViewController:gbViewController animated:YES completion:NULL];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
