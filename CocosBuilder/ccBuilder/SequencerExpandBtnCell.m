//
//  SequencerExpandBtnCell.m
//  CocosBuilder
//
//  Created by Viktor Lidholt on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SequencerExpandBtnCell.h"

@implementation SequencerExpandBtnCell

@synthesize isExpanded;

- (void) awakeFromNib
{
    //[self setButtonType:NSRadioButton];
}

- (BOOL) trackMouse:(NSEvent *)theEvent
             inRect:(NSRect)cellFrame
             ofView:(NSView *)controlView
       untilMouseUp:(BOOL)untilMouseUp
{
    NSPoint tempCoords = [controlView convertPoint: [theEvent locationInWindow] fromView: [[controlView window] contentView]];
    
    NSPoint mouseCoords = NSMakePoint(tempCoords.x - cellFrame.origin.x,
                                      tempCoords.y  - cellFrame.origin.y);
    
    // Deal with the click however you need to here, for example in a slider cell you can use the mouse x
    // coordinate to set the floatValue.
    NSLog(@"mouseCoords: (%f,%f)", mouseCoords.x, mouseCoords.y);
    
    // Dragging won't work unless you still make the call to the super class...
    return [super trackMouse: theEvent inRect: cellFrame ofView:
            controlView untilMouseUp: untilMouseUp];
}

/*
- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    //buttonCell = [[NSButtonCell alloc] init];
    
    imgExpand = [NSImage imageNamed:@"seq-btn-expand.png"];
    NSLog(@"imgExpand: %@", imgExpand);
    return self;
}*/


- (void) drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
    if (!imgExpand)
    {
        imgExpand = [NSImage imageNamed:@"seq-btn-expand.png"];
    }
    
    [imgExpand setFlipped:!isExpanded];
    [imgExpand drawAtPoint:cellFrame.origin fromRect:NSMakeRect(0, 0, 16, 16) operation:NSCompositeSourceOver fraction:1];
}

/*

- (NSUInteger)hitTestForEvent:(NSEvent *)event
                       inRect:(NSRect)cellFrame
                       ofView:(NSView *)controlView {
    NSUInteger hitType = [super hitTestForEvent:event inRect:cellFrame ofView:controlView];
    
    NSPoint location = [event locationInWindow];
    location = [controlView convertPointFromBase:location];
    // get the button cell's |buttonRect|, then
    if (NSMouseInRect(location, buttonRect, [controlView isFlipped])) {
        // We are only sent tracking messages for trackable areas.
        hitType |= NSCellHitTrackableArea;
    }
    return hitType;
}

+ (BOOL)prefersTrackingUntilMouseUp {
    // you want a single, long tracking "session" from mouse down till up
    return YES;
}

- (BOOL)startTrackingAt:(NSPoint)startPoint inView:(NSView *)controlView {
    // use NSMouseInRect and [controlView isFlipped] to test whether |startPoint| is on the button
    // if so, highlight the button
    return YES;  // keep tracking
}

- (BOOL)continueTracking:(NSPoint)lastPoint at:(NSPoint)currentPoint inView:(NSView *)controlView {
    // if |currentPoint| is in the button, highlight it
    // otherwise, unhighlight it
    return YES;  // keep on tracking
}

- (void)stopTracking:(NSPoint)lastPoint at:(NSPoint)stopPoint inView:(NSView *)controlView mouseIsUp:(BOOL)flag {
    // if |flag| and mouse in button's rect, then
    [[NSApplication sharedApplication] sendAction:self.action to:self.target from:controlView];
    // and, finally,
    [buttonCell setHighlighted:NO];
}*/

@end