//
//  DCCifraPickerViewController.h
//  Decomposer
//
//  Created by Victor Lima on 9/30/12.
//  Copyright (c) 2012 vlima. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString* const CifraGenerationNotificationKey;

@interface DCCifraPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

+( DCCifraPickerViewController* ) cifraPickerViewController;

@end
