//
//  GlossButtonViewController.m
//  GlossButton
//
//  Created by Chris Jones on 10/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GlossButtonViewController.h"

@implementation GlossButtonViewController

@synthesize	button1=_button1;
@synthesize	button2=_button2;
@synthesize	button3=_button3;
@synthesize	button4=_button4;
@synthesize	button5=_button5;
@synthesize	button6=_button6;
@synthesize	button7=_button7;
@synthesize	button8=_button8;
@synthesize	button9=_button9;
@synthesize	button0=_button0;
@synthesize	buttonPoint=_buttonPoint;

@synthesize	buttonPlus=_buttonPlus;
@synthesize	buttonMinus=_buttonMinus;
@synthesize	buttonDivide=_buttonDivide;
@synthesize	buttonMultiply=_buttonMultiply;
@synthesize	buttonEquals=_buttonEquals;
@synthesize	buttonClear=_buttonClear;
@synthesize	buttonPlusminus=_buttonPlusminus;

@synthesize buttons=_buttons;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	//background
	UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg_calc.png"]];
	self.view.backgroundColor = background;
	[background release];
	
	CGFloat height=50;
	CGFloat width=80;
	CGFloat col1=0;
	CGFloat row1=245;
	CGFloat row0=190;
	
	CGFloat spacingy=3;
	CGFloat row2=row1+height+spacingy;
	CGFloat row3=row2+height+spacingy;
	CGFloat row4=row3+height+spacingy;
	CGFloat spacingx=0;
	CGFloat col2=col1+width+spacingx;
	CGFloat col3=col2+width+spacingx;
	CGFloat col4=col3+width+spacingx;
	
	
	self.button7 = [[[CustomButton alloc] initWithText:@"7" target:self selector:@selector(buttonTapped:)] autorelease];
	_button7.frame = CGRectMake(col1,row1, width, height);
	self.button8 = [[[CustomButton alloc] initWithText:@"8" target:self selector:@selector(buttonTapped:)] autorelease];
	_button8.frame = CGRectMake(col2,row1, width, height);
	self.button9 = [[[CustomButton alloc] initWithText:@"9" target:self selector:@selector(buttonTapped:)] autorelease];
	_button9.frame = CGRectMake(col3,row1, width, height);
	self.button4 = [[[CustomButton alloc] initWithText:@"4" target:self selector:@selector(buttonTapped:)] autorelease];
	_button4.frame = CGRectMake(col1,row2, width, height);
	self.button5 = [[[CustomButton alloc] initWithText:@"5" target:self selector:@selector(buttonTapped:)] autorelease];
	_button5.frame = CGRectMake(col2,row2, width, height);
	self.button6 = [[[CustomButton alloc] initWithText:@"6" target:self selector:@selector(buttonTapped:)] autorelease];
	_button6.frame = CGRectMake(col3,row2, width, height);
	self.button1 = [[[CustomButton alloc] initWithText:@"1" target:self selector:@selector(buttonTapped:)] autorelease];
	_button1.frame = CGRectMake(col1,row3, width, height);
	self.button2 = [[[CustomButton alloc] initWithText:@"2" target:self selector:@selector(buttonTapped:)] autorelease];
	_button2.frame = CGRectMake(col2,row3, width, height);
	self.button3 = [[[CustomButton alloc] initWithText:@"3" target:self selector:@selector(buttonTapped:)] autorelease];
	_button3.frame = CGRectMake(col3,row3, width, height);
	self.button0 = [[[CustomButton alloc] initWithText:@"0" target:self selector:@selector(buttonTapped:)] autorelease];
	_button0.frame = CGRectMake(col1,row4, width*2, height);
	self.buttonPoint = [[[CustomButton alloc] initWithText:@"." target:self selector:@selector(buttonTapped:)] autorelease];
	_buttonPoint.frame = CGRectMake(col3,row4, width, height);

	self.buttonEquals = [[[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.075f saturation:0.9f brightness:0.96f] autorelease];
	_buttonEquals.frame = CGRectMake(col4,row3, width, height*2);

	self.buttonPlus = [[[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f] autorelease];
	_buttonPlus.frame = CGRectMake(col4,row2, width, height);
	self.buttonMinus = [[[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f] autorelease];
	_buttonMinus.frame = CGRectMake(col4,row1, width, height);
	self.buttonMultiply = [[[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f] autorelease];
	_buttonMultiply.frame = CGRectMake(col4,row0, width, height);

	self.buttonDivide = [[[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f] autorelease];
	_buttonDivide.frame = CGRectMake(col3,row0, width, height);
	self.buttonPlusminus = [[[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f] autorelease];
	_buttonPlusminus.frame = CGRectMake(col2,row0, width, height);
	self.buttonClear = [[[CustomButton alloc] initWithTextAndHSB:@"" target:self selector:@selector(buttonTapped:) hue:0.058f saturation:0.26f brightness:0.42f] autorelease];
	_buttonClear.frame = CGRectMake(col1,row0, width, height);

	[self.buttonClear setLabelWithText:@"AC" andSize:18.0f andVerticalShift:0.0f];
	[self.buttonMinus setLabelWithText:@"−" andSize:24.0f andVerticalShift:-2.0f];
	[self.buttonMultiply setLabelWithText:@"×" andSize:24.0f andVerticalShift:-2.0f];
	[self.buttonPlus setLabelWithText:@"+" andSize:24.0f andVerticalShift:-2.0f];
	[self.buttonDivide setLabelWithText:@"÷" andSize:24.0f andVerticalShift:-2.0f];
	[self.buttonPlusminus setLabelWithText:@"±" andSize:24.0f andVerticalShift:-2.0f];

	[self.buttonEquals setLabelWithText:@"=" andSize:24.0f andVerticalShift:22.0f];

	_buttonPlus.toggled=YES;
	
	self.buttons = [NSMutableArray arrayWithObjects:
                      _button1,                            
                      _button2, 
                      _button3, 
					_button4,                            
					_button5, 
					_button6, 
					_button7,                            
					_button8, 
					_button9, 
					_button0,                            
					_buttonPoint, 
					_buttonPlus,
					_buttonEquals,
					_buttonMinus,
					_buttonMultiply,
					_buttonClear,
					_buttonPlusminus,
					_buttonDivide,
					

                      nil];
	
    for (CustomButton *button in _buttons) {
        [self.view addSubview:button];
    }

}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
