//
//  ViewController.h
//  database
//
//  Created by lololol on 12/22/15.
//  Copyright © 2015 Kenny Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InquireViewController : UIViewController
{
    NSMutableArray *lol;
    NSURLConnection *postConnection;
}
@property (weak, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UIButton *inquire;
@property (weak, nonatomic) IBOutlet UILabel *output;
@property (weak, nonatomic) IBOutlet UILabel *preorder;
@property (weak, nonatomic) IBOutlet UILabel *user;
@property (weak, nonatomic) IBOutlet UILabel *dish;
@property (weak, nonatomic) IBOutlet UILabel *price;


-(IBAction)inquireButtonPressed:(id)sender;
@end

