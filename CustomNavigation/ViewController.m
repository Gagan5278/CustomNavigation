//
//  ViewController.m
//  CustomNavigation
//
//  Created by Vishal Mishra, Gagan on 7/14/15.
//  Copyright (c) 2015 Gagan Vishal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *dictionaryForTableCell;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dictionaryForTableCell= [NSMutableDictionary dictionary];
    self.selectedAnimationIndex=0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -tableview Datasource & Delegates

- (CGRect)rectForHeaderInSection:(NSInteger)section
{
    CGRect headerRect = [[self.myTableView headerViewForSection:section] frame];
    headerRect.size.height =45.0;
    return headerRect;
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *stringTitle=[NSString stringWithFormat:@"In Section %ld",(long)section];
    return stringTitle;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 20;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.textColor=[UIColor redColor];
    cell.textLabel.text=[NSString stringWithFormat:@"Colorful cell is :%ld",indexPath.row];
    cell.detailTextLabel.textColor=[UIColor blueColor];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"Colorful Subtitile"];
    cell.imageView.image=[UIImage imageNamed:@"Image.png"];
    cell.selectionStyle=UITableViewCellSelectionStyleBlue;
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellRow = [NSString stringWithFormat:@"%ld",indexPath.row];
    UITableViewCell *cell= [tableView cellForRowAtIndexPath:indexPath];
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    if([dictionaryForTableCell objectForKey:cellRow]==nil)
    {
        [dictionaryForTableCell setObject:cellRow forKey:cellRow];
        rotationAndPerspectiveTransform.m44 = 1.0 / -1000;
    }
    else{
      [dictionaryForTableCell removeObjectForKey:cellRow];
        rotationAndPerspectiveTransform.m44 = 1.0 / 1000;
    }
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, M_PI / 0.3, 0.0f, 1.0f, 0.0f);  //Change X,Y,Z value to 1.0 for different types of animation
    cell.layer.transform = rotationAndPerspectiveTransform;
    [UIView animateWithDuration:1.0 animations:^{
       cell.layer.transform = CATransform3DIdentity;
    }];
}

-(void)tableView:(UITableView*)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CATransform3D rotationTranform;
    rotationTranform=CATransform3DMakeRotation((90*M_PI)/90, 0.0, 0.1, 0.7);
    
    cell.layer.shadowColor=[UIColor blackColor].CGColor;
    cell.layer.shadowOffset=CGSizeMake(10, 10);
    cell.alpha=0.0;
    cell.layer.transform=rotationTranform;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.2];
    cell.layer.transform=CATransform3DIdentity;
    cell.alpha=1.0;
    cell.layer.shadowOffset=CGSizeMake(4, 4);
    [UIView commitAnimations];
}

-(void)tableView:(UITableView*)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    CATransform3D rotationTranform;
    rotationTranform=CATransform3DMakeRotation((90*M_PI)/180, 0.0, 0.4, 0.7);
    
    view.layer.shadowColor=[UIColor blackColor].CGColor;
    view.layer.shadowOffset=CGSizeMake(10, 10);
    view.alpha=0.0;
    view.layer.transform=rotationTranform;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.2];
    view.layer.transform=CATransform3DIdentity;
    view.alpha=1.0;
    view.layer.shadowOffset=CGSizeMake(4, 4);
    [UIView commitAnimations];
}

- (IBAction)AnimationButtonSelected:(id)sender {
    UIBarButtonItem *button =(UIBarButtonItem*)sender;
    switch (button.tag) {
        case firstAnimation:
            self.selectedAnimationIndex=0;
            break;
        case secondAnimation:
            self.selectedAnimationIndex=1;
            break;
        case thirdAnimation:
            self.selectedAnimationIndex=2;
            break;
        case fourthAnimation:
            self.selectedAnimationIndex=3;
            break;
        default:
            break;
    }
}
@end
