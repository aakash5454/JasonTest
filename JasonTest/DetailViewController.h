//
//  DetailViewController.h
//  JasonTest
//
//  Created by Sky on 2/24/15.
//  Copyright (c) 2015 com.skypirate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

