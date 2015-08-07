//
//  ViewController.h
//  CustomNavigation
//
//  Created by Vishal Mishra, Gagan on 7/14/15.
//  Copyright (c) 2015 Gagan Vishal. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum cellAnimation
{
    firstAnimation,
    secondAnimation,
    thirdAnimation,
    fourthAnimation
}selectedCellAnimation;
@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (assign) NSInteger selectedAnimationIndex;
- (IBAction)AnimationButtonSelected:(id)sender;

@end

