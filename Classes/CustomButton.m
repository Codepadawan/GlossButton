//
//  CustomButton.m
//
//  Created by Chris Jones.
//  Copyright 2011 Chris Jones. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "CustomButton.h"
#import "Common.h"
#import <QuartzCore/QuartzCore.h>

#define kButtonRadius 6.0

@implementation CustomButton
@synthesize selected = _selected;
@synthesize toggled=_toggled;
@synthesize pause = _pause;
@synthesize invocation = _invocation;
@synthesize hue = _hue;
@synthesize saturation = _saturation;
@synthesize brightness = _brightness;
@synthesize buttonStyle = _buttonStyle;
@synthesize label=_label;

-(id) initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        _hue = 1.0;
        _saturation = 1.0;
        _brightness = 1.0;
    }
    return self;
}


- (id)initWithTextAndHSB:(NSString *)text target:(id)target selector:(SEL)selector hue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness {

	_hue=hue;
	_saturation=saturation;
	_brightness=brightness;
	
    if ((self = [super initWithFrame:CGRectZero])) {
        
        // Create invocation to be called upon a tap        
        if (target && selector) {
            NSMethodSignature *signature = [[target class] instanceMethodSignatureForSelector:selector];
            if (signature != nil) {
                self.invocation = [NSInvocation invocationWithMethodSignature:signature];
                [_invocation setTarget:target];
                [_invocation setSelector:selector];
                [_invocation setArgument:&self atIndex:2];                
            }
        }
        if (text==@"X") {			
			UIImage	*image = [UIImage imageNamed:@"backspace.png"];
			UIImageView	*imageView = [[UIImageView alloc] initWithFrame:CGRectMake (20,10,40,32)];
			
			//add a shadow to the image to make it look "inset" into the button
			CALayer * shadowLayer = [imageView layer];
			shadowLayer.masksToBounds = NO;
			shadowLayer.shadowOffset = CGSizeMake(0,-1);
			shadowLayer.shadowOpacity = 0.7f;
			shadowLayer.shadowRadius = 0.5;
			
			[imageView setImage:image];
			[self addSubview:imageView];
		} else if (text==@"Tab") {
			
			UIImage	*image = [UIImage imageNamed:@"tab2.png"];
			UIImageView	*imageView = [[UIImageView alloc] initWithFrame:CGRectMake (20,10,40,32)];
			
			//add a shadow to the image to make it look "inset" into the button
			CALayer * shadowLayer = [imageView layer];
			shadowLayer.masksToBounds = NO;
			shadowLayer.shadowOffset = CGSizeMake(0,-1);
			shadowLayer.shadowOpacity = 0.7f;
			shadowLayer.shadowRadius = 0.5;
			
			[imageView setImage:image];
			[self addSubview:imageView];
			_pause = YES;			
		} else {
            // Create label for button
            UILabel *label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
            label.textAlignment = UITextAlignmentCenter;
            label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            label.text = text;
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];

			label.font = [UIFont boldSystemFontOfSize:24];
			
			CALayer * shadowLayer = [label layer];
			shadowLayer.masksToBounds = NO;
			shadowLayer.shadowOffset = CGSizeMake(0,-1);
			shadowLayer.shadowOpacity = 0.7f;
			shadowLayer.shadowRadius = 0.5;
			
            [self addSubview:label];
            _label = label;
        }

    }
    return self;
}

- (void)setLabelWithText:(NSString*)text andSize:(float)size andVerticalShift:(float)shift {
	// Create label for button
	CGRect frame=CGRectMake(self.bounds.origin.x, self.bounds.origin.y+shift, self.bounds.size.width, self.bounds.size.height);
	UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
	label.textAlignment = UITextAlignmentCenter;
	label.text = text;
	label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
	
	label.font = [UIFont boldSystemFontOfSize:size];
	
	CALayer * shadowLayer = [label layer];
	shadowLayer.masksToBounds = NO;
	shadowLayer.shadowOffset = CGSizeMake(0,-1);
	shadowLayer.shadowOpacity = 0.7f;
	shadowLayer.shadowRadius = 0.5;
	
	[self addSubview:label];
	_label = label;
}

- (id)initWithText:(NSString *)text target:(id)target selector:(SEL)selector {
	
	[self initWithTextAndHSB:text target:target selector:selector hue:0.0f saturation:0.0f brightness:0.0f];
	
	return self;
	
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
	
    CGFloat actualBrightness = _brightness;
    if (self.selected) {
        actualBrightness -= 0.10;
    }   
    
    CGColorRef blackColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0].CGColor;
    CGColorRef highlightStart = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7].CGColor;
    CGColorRef highlightStop = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0].CGColor;

	CGColorRef outerTop = [UIColor colorWithHue:_hue saturation:_saturation brightness:1.0*actualBrightness alpha:1.0].CGColor;
    CGColorRef outerBottom = [UIColor colorWithHue:_hue saturation:_saturation brightness:0.80*actualBrightness alpha:1.0].CGColor;
	
    CGFloat outerMargin = 7.5f;
    CGRect outerRect = CGRectInset(self.bounds, outerMargin, outerMargin);            
    CGMutablePathRef outerPath = createRoundedRectForRect(outerRect, 6.0);
	
    // Draw gradient for outer path
	CGContextSaveGState(context);
	CGContextAddPath(context, outerPath);
	CGContextClip(context);
	drawLinearGradient(context, outerRect, outerTop, outerBottom);

	CGContextRestoreGState(context);
	    
	if (!self.selected) {

		CGRect highlightRect = CGRectInset(outerRect, 1.0f, 1.0f);
		CGMutablePathRef highlightPath = createRoundedRectForRect(highlightRect, 6.0);

		CGContextSaveGState(context);
		CGContextAddPath(context, outerPath);
		CGContextAddPath(context, highlightPath);
		CGContextEOClip(context);

		drawLinearGradient(context, CGRectMake(outerRect.origin.x, outerRect.origin.y, outerRect.size.width, outerRect.size.height/3), highlightStart, highlightStop);
		CGContextRestoreGState(context);
		
		drawCurvedGloss(context, outerRect, 180);
		CFRelease(highlightPath);

	}
	else {
		//reverse non-curved gradient when pressed
		CGContextSaveGState(context);
		CGContextAddPath(context, outerPath);
		CGContextClip(context);
		drawLinearGloss(context, outerRect, TRUE);		
		CGContextRestoreGState(context);
		
	}
	if (!self.toggled) {
		//bottom highlight
		CGRect highlightRect2 = CGRectInset(self.bounds, 6.5f, 6.5f);
		CGMutablePathRef highlightPath2 = createRoundedRectForRect(highlightRect2, 6.0);
		
		CGContextSaveGState(context);
		CGContextSetLineWidth(context, 0.5);
		CGContextAddPath(context, highlightPath2);
		CGContextAddPath(context, outerPath);
		CGContextEOClip(context);
		drawLinearGradient(context, CGRectMake(self.bounds.origin.x, self.bounds.size.height-self.bounds.size.height/3, self.bounds.size.width, self.bounds.size.height/3), highlightStop, highlightStart);

		CGContextRestoreGState(context);
		CFRelease(highlightPath2);
	}
    else {
		//toggle marker
		CGRect toggleRect= CGRectInset(self.bounds, 5.0f, 5.0f);
		CGMutablePathRef togglePath= createRoundedRectForRect(toggleRect, 8.0);

		CGContextSaveGState(context);
		CGContextSetLineWidth(context, 3.5);
		CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
		CGContextAddPath(context, togglePath);
		CGContextStrokePath(context);
		CGContextRestoreGState(context);
		CFRelease(togglePath);
	}
    // Stroke outer path
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 0.5);
    CGContextSetStrokeColorWithColor(context, blackColor);
    CGContextAddPath(context, outerPath);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);

    CFRelease(outerPath);
   
    
}

-(void) setToggled:(BOOL)toggled {
    if (_toggled == toggled) return;    
    _toggled = toggled;
    [self setNeedsDisplay];
}

-(void) setSelected:(BOOL)selected {
    if (_selected == selected) return;    
    _selected = selected;
    [self setNeedsDisplay];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.selected = YES;    
    if (_invocation != nil) {
        if (!_pause) [_invocation invoke];
    }    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.selected = NO;
	if (_pause) [_invocation invoke];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.selected = NO;
}

- (void)dealloc {
    [_invocation release];
    _invocation = nil;
    [super dealloc];
}

@end
