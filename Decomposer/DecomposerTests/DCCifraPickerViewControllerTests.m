//
//  DCCifraPickerViewControllerTests.m
//  Decomposer
//
//  Created by Victor Lima on 9/30/12.
//  Copyright (c) 2012 vlima. All rights reserved.
//

#import "DCCifraPickerViewControllerTests.h"

@implementation DCCifraPickerViewControllerTests

-( void ) test_should_adhere_to_uipickerviewdelegate_and_datasource
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  
  STAssertTrue( [dcp conformsToProtocol:@protocol(UIPickerViewDelegate)], @"" );
  STAssertTrue( [dcp conformsToProtocol:@protocol(UIPickerViewDataSource)], @"" );
  
}

@end
