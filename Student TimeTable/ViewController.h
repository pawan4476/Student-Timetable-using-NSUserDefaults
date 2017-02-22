//
//  ViewController.h
//  Student TimeTable
//
//  Created by Nagam Pawan on 9/27/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)buttonPressed:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *button;

@end

