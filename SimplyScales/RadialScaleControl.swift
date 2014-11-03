import Foundation
import UIKit


//RadialScaleControlModes
protocol RadialScaleControlDelegate {
}

protocol RadialScaleControlDatasource {
}

enum RadialScaleControlMode {
    case Idle
    case Play
    case Edit
}

@IBDesignable class RadialScaleControl : UIView, RadialScaleControlDelegate, RadialScaleControlDatasource {
    //MARK: Variables
    let centerCircleLayer = CAShapeLayer()
    let segmentsLayer = CALayer()
    let lockLayer = CAShapeLayer()
    let noteNamesLayer = CALayer()
    
    var controlMode : RadialScaleControlMode = .Play {
        didSet{
            if(controlMode == .Play){
                self.multipleTouchEnabled = true
            }else if (controlMode == .Edit){
                self.multipleTouchEnabled = false
            }
            updateLockLayer()
        }
    }
    
    var spacing:CGFloat = 4 {
        didSet{
            layoutCenterCircleLayer()
            layoutSegmentsLayer()
            layoutLockLayer()
            layoutNoteNamesLayer()
        }
    }
    var segmentThickness:CGFloat = 45 {
        didSet{
            layoutCenterCircleLayer()
            layoutSegmentsLayer()
            layoutLockLayer()
            layoutNoteNamesLayer()
        }
    }
    //125
    var radius:CGFloat = 135 {
        didSet{
            layoutCenterCircleLayer()
            layoutSegmentsLayer()
            layoutLockLayer()
            layoutNoteNamesLayer()
        }
    }
    var startAngle:CGFloat = 3 * CGFloat(M_PI_2) {
        didSet{
            layoutSegmentsLayer()
        }
    }
    
    var tonic:Int = 0 {
        didSet{
            //Rotates the segments based on the tonic
            CATransaction.begin()
            CATransaction.setAnimationDuration(1)
            segmentsLayer.transform = CATransform3DMakeRotation(CGFloat(M_PI * 2) / CGFloat(pattern.count) * CGFloat(tonic), 0, 0, 1.0)
            CATransaction.commit()
            updateSegmentsLayer()
        }
    }
    var pattern:[Int] = [1,0,1,1,0,1,1,0,1,0,1,1]
    var selectedSegmentIndecies:NSMutableIndexSet = NSMutableIndexSet(){
        didSet{
            updateSegmentsLayer()
        }
    }
    
    override var frame: CGRect {
        didSet {
            initialize()
        }
    }
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutAll()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initialize(){
        //Add Layers
        layer.addSublayer(centerCircleLayer)
        layer.addSublayer(segmentsLayer)
        layer.addSublayer(lockLayer)
        layer.addSublayer(noteNamesLayer)
        
        //Layout Layers
        layoutCenterCircleLayer()
        layoutSegmentsLayer()
        layoutLockLayer()
        layoutNoteNamesLayer()
    }
    
    func updateAll(){
        updateCenterCircleLayer()
        updateSegmentsLayer()
        updateLockLayer()
        updateNoteNamesLayer()
    }
    
    func layoutAll(){
        layoutCenterCircleLayer()
        layoutSegmentsLayer()
        layoutLockLayer()
        layoutNoteNamesLayer()
    }
    
    // MARK: Layer Methods
    
    /**
    Layout the center circle layer.
    */
    func layoutCenterCircleLayer() {
        centerCircleLayer.bounds = self.bounds
        centerCircleLayer.anchorPoint = CGPointMake(0.5, 0.5)
        centerCircleLayer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        
        //Path
        let p = CGPathCreateMutable();
        CGPathAddEllipseInRect(p, nil, CGRectInset(self.bounds, self.frame.size.width/2 - radius + spacing + segmentThickness, self.frame.size.height/2 - radius + spacing + segmentThickness))
        centerCircleLayer.path = p
        updateCenterCircleLayer()
    }
    
    /**
    Layout the segments layer.
    */
    func layoutSegmentsLayer() {
        segmentsLayer.bounds = self.bounds
        segmentsLayer.anchorPoint = CGPointMake(0.5, 0.5)
        segmentsLayer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        
        //Removes all layers
        segmentsLayer.sublayers?.removeAll()
        
        //For all segments
        for(var i = 0; i < pattern.count; i++){
            let segmentAngle:CGFloat = CGFloat(M_PI * 2) / CGFloat(pattern.count);
            let sAngle:CGFloat = startAngle - segmentAngle/2
            let eAngle:CGFloat = sAngle + segmentAngle
            let curveRadius : CGFloat = 2;
            let actualCenterPoint : CGPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
            
            //Corner Points
            let p1 = CGPointMake(actualCenterPoint.x + (radius - segmentThickness) * cos(sAngle + atan((spacing/2)/(radius - segmentThickness))), actualCenterPoint.y + (radius - segmentThickness) * sin(sAngle + atan((spacing/2)/(radius - segmentThickness))))
            let p2 = CGPointMake(actualCenterPoint.x + (radius) * cos(sAngle + atan((spacing/2)/(radius))), actualCenterPoint.y + (radius) * sin(sAngle + atan((spacing/2)/(radius))))
            let p3 = CGPointMake(actualCenterPoint.x + (radius) * cos(eAngle - atan((spacing/2)/(radius))), actualCenterPoint.y + (radius) * sin(eAngle - atan((spacing/2)/(radius))))
            let p4 = CGPointMake(actualCenterPoint.x + (radius - segmentThickness) * cos(eAngle - atan((spacing/2)/(radius - segmentThickness))), actualCenterPoint.y + (radius - segmentThickness) * sin(eAngle - atan((spacing/2)/(radius - segmentThickness))))
            
            //Curve Points
            let p5 = CGPointMake(actualCenterPoint.x + (radius - segmentThickness) * cos(sAngle + atan((spacing/2 + curveRadius)/(radius - segmentThickness))), actualCenterPoint.y + (radius - segmentThickness) * sin(sAngle + atan((spacing/2 + curveRadius)/(radius - segmentThickness))))
            let p6 = CGPointMake(actualCenterPoint.x + (radius - segmentThickness + curveRadius) * cos(sAngle + atan((spacing/2)/(radius - segmentThickness + curveRadius))), actualCenterPoint.y + (radius - segmentThickness + curveRadius) * sin(sAngle + atan((spacing/2)/(radius - segmentThickness + curveRadius))))
            let p7 = CGPointMake(actualCenterPoint.x + (radius - curveRadius) * cos(sAngle + atan((spacing/2)/(radius - curveRadius))), actualCenterPoint.y + (radius - curveRadius) * sin(sAngle + atan((spacing/2)/(radius - curveRadius))))
            let p8 = CGPointMake(actualCenterPoint.x + (radius) * cos(sAngle + atan((spacing/2 + curveRadius)/(radius))), actualCenterPoint.y + (radius) * sin(sAngle + atan((spacing/2 + curveRadius)/(radius))))
            let p9 = CGPointMake(actualCenterPoint.x + (radius) * cos(eAngle - atan((spacing/2 + curveRadius)/(radius))), actualCenterPoint.y + (radius) * sin(eAngle - atan((spacing/2 + curveRadius)/(radius))))
            let p10 = CGPointMake(actualCenterPoint.x + (radius - curveRadius) * cos(eAngle - atan((spacing/2)/(radius - curveRadius))), actualCenterPoint.y + (radius - curveRadius) * sin(eAngle - atan((spacing/2)/(radius - curveRadius))))
            let p11 = CGPointMake(actualCenterPoint.x + (radius - segmentThickness + curveRadius) * cos(eAngle - atan((spacing/2)/(radius - segmentThickness + curveRadius))), actualCenterPoint.y + (radius - segmentThickness + curveRadius) * sin(eAngle - atan((spacing/2)/(radius - segmentThickness + curveRadius))))
            let p12 = CGPointMake(actualCenterPoint.x + (radius - segmentThickness) * cos(eAngle - atan((spacing/2 + curveRadius)/(radius - segmentThickness))), actualCenterPoint.y + (radius - segmentThickness) * sin(eAngle - atan((spacing/2 + curveRadius)/(radius - segmentThickness))))
            
            var segment = CAShapeLayer()
            let p = CGPathCreateMutable()
            //Path for segment
            CGPathMoveToPoint(p, nil, p5.x, p5.y)
            CGPathAddArcToPoint(p, nil, p1.x, p1.y, p6.x, p6.y, curveRadius)
            CGPathAddLineToPoint(p, nil, p7.x, p7.y)
            CGPathAddArcToPoint(p, nil, p2.x, p2.y, p8.x, p8.y, curveRadius)
            CGPathAddArc(p, nil, actualCenterPoint.x, actualCenterPoint.y, radius, sAngle + atan((spacing/2 + curveRadius)/radius), eAngle - atan((spacing/2 + curveRadius)/radius), false)
            CGPathAddArcToPoint(p, nil, p3.x, p3.y, p10.x, p10.y, curveRadius)
            CGPathAddLineToPoint(p, nil, p11.x, p11.y)
            CGPathAddArcToPoint(p, nil, p4.x, p4.y, p12.x, p12.y, curveRadius)
            CGPathAddArc(p, nil, actualCenterPoint.x, actualCenterPoint.y, radius - segmentThickness, eAngle - atan((spacing/2 + curveRadius)/(radius - segmentThickness)), sAngle + atan((spacing/2 + curveRadius)/(radius - segmentThickness)), true)
            
            segment.path = p
            segment.strokeColor = UIColor.clearColor().CGColor
            segment.bounds = self.bounds
            segment.anchorPoint = CGPointMake(0.5, 0.5)
            segment.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
            segment.transform = CATransform3DMakeRotation(CGFloat(i) * CGFloat(M_PI * 2) / CGFloat(pattern.count), 0.0, 0.0, 1.0)
            CATransaction.begin()
            CATransaction.setAnimationDuration(1)
            segmentsLayer.transform = CATransform3DMakeRotation((CGFloat(M_PI)/6) * CGFloat(tonic), 0, 0, 1.0)
            CATransaction.commit()
            //If the segment is the first, Draw a circle on top of it
            if (i == 0){
                let smallCircleSize = CGSizeMake(12, 12);
                let r:CGFloat = radius - segmentThickness/2;
                let xpos = self.frame.size.width/2 + (r * CGFloat(cos(startAngle)) - smallCircleSize.width / 2);
                let ypos = self.frame.size.height/2 + (r * CGFloat(sin(startAngle)) - smallCircleSize.height / 2);
                
                let circle = CAShapeLayer()
                let p = CGPathCreateMutable();
                CGPathAddEllipseInRect(p, nil, CGRectMake(xpos, ypos, smallCircleSize.width, smallCircleSize.height))
                circle.path = p
                circle.strokeColor = UIColor.clearColor().CGColor
                circle.fillColor = UIColor.whiteColor().CGColor
                segment.addSublayer(circle)
            }
            segmentsLayer.addSublayer(segment)
        }
        CATransaction.commit()
        updateSegmentsLayer()
    }

    /**
    Layout the lock layer.
    */
    func layoutLockLayer() {
        lockLayer.bounds = self.bounds
        lockLayer.anchorPoint = CGPointMake(0.5, 0.5)
        lockLayer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        
        //Removes all layers
        lockLayer.sublayers?.removeAll()
    
        var primaryRadius = radius - segmentThickness - spacing
        var h:CGFloat = 50;
        
        //Bound check
        if(h < 0){
            h = 0;
        }else if(h > 2 * primaryRadius){
            h = 2 * primaryRadius;
        }
        var sAngle = -atan((h - primaryRadius)/sqrt(h * (2 * primaryRadius - h)))
        var eAngle = CGFloat(M_PI) - sAngle
        
        //Path
        let p = CGPathCreateMutable();
        CGPathAddArc(p, nil, self.frame.size.width/2, self.frame.size.height/2, primaryRadius, sAngle, eAngle, false)
        lockLayer.path = p
        
        //Apperence
        lockLayer.fillColor = UIColor.blackColor().colorWithAlphaComponent(0.05).CGColor
        
        var layer = CALayer()
        layer.frame = CGRectMake(self.frame.size.width/2 - 13, self.frame.size.height/2 - 13 + primaryRadius - h/2, 26, 26)
        lockLayer.addSublayer(layer)
        CATransaction.commit()
        
        updateLockLayer()
    }
    
    /**
    Layout the note names layer
    */
    func layoutNoteNamesLayer() {
        noteNamesLayer.bounds = self.bounds
        noteNamesLayer.anchorPoint = CGPointMake(0.5, 0.5)
        noteNamesLayer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        
        //Removes all layers
        noteNamesLayer.sublayers?.removeAll()
        
        updateNoteNamesLayer()
    }
    
    /**
    Updates the center circle layers apperance.
    */
    func updateCenterCircleLayer() {
        centerCircleLayer.fillColor = tintColor.CGColor
    }
    
    /**
    Updates the segments layers apperance.
    */
    func updateSegmentsLayer() {
        var counter:Int = 0
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        for layer in segmentsLayer.sublayers as [CAShapeLayer]{
            var shiftedIndex = counter + tonic;
            if shiftedIndex >= pattern.count {
                shiftedIndex -= pattern.count;
            }
            if(pattern[counter] == 1){
                if(selectedSegmentIndecies.containsIndex(shiftedIndex)){
                    layer.fillColor = self.tintColor.colorWithBrightnessModifier(0.7).CGColor
                }else{
                    layer.fillColor = self.tintColor.CGColor
                }
            }else{
                layer.fillColor = self.tintColor.colorWithAlphaComponent(0.15).CGColor;
            }
            counter = counter + 1
        }
        CATransaction.commit()
       
    }
    
    /**
    Updates the lock layers apperance.
    */
    func updateLockLayer() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        if(lockLayer.sublayers != nil){
            for layer in lockLayer.sublayers as [CALayer]{
                if(controlMode == RadialScaleControlMode.Play){
                    layer.contents = UIImage(named: "Icon_Lock")?.CGImage
                }else if(controlMode == RadialScaleControlMode.Edit){
                    layer.contents = UIImage(named:"Icon_Unlock")?.CGImage
                }
            }
        }
        CATransaction.commit()
    }
    
    /**
    Updates the note name layers apperance.
    */
    func updateNoteNamesLayer() {
        
    }
    
    //MARK: Tint Color
    
    override func tintColorDidChange() {
        updateCenterCircleLayer()
        updateSegmentsLayer()
        updateLockLayer()
        updateNoteNamesLayer()
    }
    
    //MARK: Touch Handling
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //Determines how the control should react
        if(controlMode == .Play){
            var indecies : NSMutableIndexSet = getValidIndexesForAllTouchesInEvent(event);
            indecies.enumerateIndexesUsingBlock { (index, _) in
                if(!self.selectedSegmentIndecies.containsIndex(index)){
                    //Play note
                }
            }
            selectedSegmentIndecies = indecies;
        }else if(controlMode == .Edit){
            var location = touches.anyObject()!.locationInView(self)
            if(pointIsValid(location) && segmentIndexRelativeToPoint(location) != 0){
                if(pattern[segmentIndexRelativeToPoint(location)] == 0){
                    pattern[segmentIndexRelativeToPoint(location)] = 1
                }else{
                    pattern[segmentIndexRelativeToPoint(location)] = 0
                }
                updateSegmentsLayer()
            }
        }else if(controlMode == .Idle){
            //Do nothing
        }
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        //Determines how the control should react
        if(controlMode == .Play){
            //Do nothing
        }else if(controlMode == .Edit){
            //Do nothing
        }else if(controlMode == .Idle){
            //Do nothing
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        //Determines how the control should react
        if(controlMode == .Play){
            //Do nothing
        }else if(controlMode == .Edit){
            //Do nothing
        }else if(controlMode == .Idle){
            //Do nothing
        }
        
        //Toggles the controlMode
        if (CGPathContainsPoint(lockLayer.path, nil, touches.anyObject()!.locationInView(self), true)) {
            // This touch is in this shape layer
            if(controlMode == .Play){
                controlMode = .Edit
            }else if(controlMode == .Edit){
                controlMode = .Play
            }
        }
        updateLockLayer()
    }
    
    //MARK: Setters
    /**
    Determines the indexes which are located at every touch location
    
    :param: event A UIEvent
    
    :returns: NSMutableIndexSet containg all segments which should be selected
    */
    func getValidIndexesForAllTouchesInEvent(event:UIEvent) -> NSMutableIndexSet{
        var indexSet = NSMutableIndexSet()
        for touch in event.allTouches()?.allObjects as [UITouch]{
            if(touch.phase != UITouchPhase.Ended){
                var location = touch.locationInView(self)
                if(pointIsValid(location)){
                    indexSet.addIndex(segmentIndexRelativeToPoint(location))
                }
            }
        }
    return indexSet;
    }
    /**
    Indicates whether a point is valid (within a certain distance from the center)
    
    :param: location A point
    
    :returns: A bool indicating the validity
    */
    func pointIsValid(location:CGPoint) -> Bool{
        var distance = sqrt(pow((self.frame.size.width/2 - location.x), 2.0) + pow((self.frame.size.height/2 - location.y), 2.0));
        if(distance < radius && distance > (radius - segmentThickness - spacing)){
            return true
        }else{
            return false
        }
    }
    
    
    /**
    Determines the coresponding segment index based on the angle between the start angle and the angular position of a point
    
    :param: location A point which will be used to calculate delta theta
    
    :returns: A segment index
    */
    func segmentIndexRelativeToPoint(point : CGPoint) -> Int {
    
        var centerd = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
    
        var x : CGFloat = point.x - centerd.x;
        var y : CGFloat = point.y - centerd.y;
        var thetaR = atan(y/x)
        var theta : CGFloat;
        if (x >= 0 && y < 0){
            // Q1
            theta = CGFloat(2*M_PI) + thetaR
        }else if (x >= 0 && y >= 0){
            // Q4
            theta = thetaR;
        }else if (x < 0 && y < 0){
            // Q2
            theta = CGFloat(M_PI) + thetaR;
        }else if (x < 0 && y >= 0){
            // Q3
            theta = CGFloat(M_PI) + thetaR;
        }else {
            return -1;
        }
        theta = theta - startAngle;
        var index : Int = lround(Double(theta) / ((M_PI * 2) / Double(pattern.count)))
        
        //Range Check
        while(index >= pattern.count) {index -= pattern.count}
        while(index < 0){index += pattern.count}
        return index
    }
}