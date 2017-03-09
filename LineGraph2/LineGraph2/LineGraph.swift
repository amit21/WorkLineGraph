//
//  LineGraph.swift
//  LineGraph2
//
//  Created by GDB Technologies on 06/03/17.
//  Copyright © 2017 GDB Technologies. All rights reserved.
//

import UIKit

class LineGraph: UIScrollView {
    
    // BG, axis colors
    
    var lineViewBGColor: UIColor = UIColor.white
    
    var XYAxixColor = UIColor.black
    
    var otherLinesColor = UIColor.red
    
    var ecgSignalColor = UIColor.black
    
    // Superview Frame
    
    var superViewWidth: CGFloat = 400.0
    
    var superViewHeight: CGFloat = 400.0
    
    // Line graph start Points
    
    var graphYUp: CGFloat = 30.0
    
    var graphYDown: CGFloat = 30.0
    
    // Iteration Limit
    
    var horizontalLinesIterationCount: Int = 10
    
    var verticalLinesIterationCount: Int = 100
    
    // Line Width
    
    var ecgSignalLineWidth: CGFloat = 1.0
    
    var lineWidth: CGFloat = 0.0
    
    // Spacing between lines
    
    var horizontalSpacing:CGFloat = 30.0
    
    var verticalSpacing:CGFloat = 30.0
    
    // Padding And GraphX values should be same
    
    var padding:CGFloat = 30.0
    
    var graphX: CGFloat = 30.0
    
    // Points
    
    private var lastPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    private var currentPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    // Temp
    
    let MAX  = 5
    
    let MIN  = -5
    
    func createLineGraph(frame:CGRect) {
        
        graphYUp = (self.superViewHeight / 2)
        
        graphYDown = (self.superViewHeight / 2)
        
        self.backgroundColor = lineViewBGColor
        
        for var i in (0..<verticalLinesIterationCount) {
            
            // Vertical Lines
            
            if padding == graphX {
                
                drawLineFromPoint(start: CGPoint(x: graphX,y :padding), toPoint: CGPoint(x: graphX,y :(superViewHeight - padding)), ofColor: XYAxixColor, lineWidth:lineWidth, inView: self)
            } else {
                
                if i % 10 == 0 {
                    
                    drawLineFromPoint(start: CGPoint(x: graphX,y :padding), toPoint: CGPoint(x: graphX,y :(superViewHeight - padding)), ofColor: otherLinesColor, lineWidth:ecgSignalLineWidth, inView: self)
                    
                } else {
                    
                    drawLineFromPoint(start: CGPoint(x: graphX,y :padding), toPoint: CGPoint(x: graphX,y :(superViewHeight - padding)), ofColor: otherLinesColor, lineWidth:lineWidth, inView: self)
                }
                
            }
            
            graphX = graphX + horizontalSpacing
        }
        
        for var i in (0..<horizontalLinesIterationCount) {
            
            // Horizontal Lines
            
            if graphYUp == (self.superViewHeight / 2) {
                
                drawLineFromPoint(start: CGPoint(x: padding,y :graphYUp), toPoint: CGPoint(x: graphX - padding,y :graphYUp), ofColor: XYAxixColor, lineWidth:lineWidth, inView: self)
                
            } else {
                
                if i % 10 == 0 {
                    
                    drawLineFromPoint(start: CGPoint(x: padding,y :graphYUp), toPoint: CGPoint(x: graphX - padding,y :graphYUp), ofColor: otherLinesColor, lineWidth:ecgSignalLineWidth, inView: self)
                    
                    drawLineFromPoint(start: CGPoint(x: padding,y :graphYDown), toPoint: CGPoint(x: graphX - padding,y :graphYDown), ofColor: otherLinesColor, lineWidth:ecgSignalLineWidth, inView: self)
                    
                } else {
                    
                    drawLineFromPoint(start: CGPoint(x: padding,y :graphYUp), toPoint: CGPoint(x: graphX - padding,y :graphYUp), ofColor: otherLinesColor, lineWidth:lineWidth, inView: self)
                    
                    drawLineFromPoint(start: CGPoint(x: padding,y :graphYDown), toPoint: CGPoint(x: graphX - padding,y :graphYDown), ofColor: otherLinesColor, lineWidth:lineWidth, inView: self)
                }
                
                
            }
            
            graphYUp = graphYUp - verticalSpacing
            
            graphYDown = graphYDown + verticalSpacing
            
        }
        
        self.contentSize = CGSize(width: graphX, height: superViewHeight)
        
        lastPoint = CGPoint(x: padding, y: (self.superViewHeight / 2))
        
        currentPoint = CGPoint(x: padding, y: (self.superViewHeight / 2))

        
        if #available(iOS 10.0, *) {
            
            _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                
                self.randomNumber()
                
            })
        } else {
            // Fallback on earlier versions
        }

        
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, lineWidth:CGFloat, inView view:UIScrollView) {
        
        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func randomNumber() {
        
        let random_number = Int(arc4random_uniform(UInt32(MAX - MIN + 1))) + Int(MIN)
        
        print ("random = ", random_number);
        
        drawLineFromPoint(start: lastPoint, toPoint: currentPoint, ofColor: ecgSignalColor, lineWidth: ecgSignalLineWidth, inView: self)
        
        lastPoint = currentPoint
        
        let newXCoordinate:CGFloat = lastPoint.x + horizontalSpacing
        
        let newYCoordinate:CGFloat = (self.superViewHeight / 2) - CGFloat(random_number * Int(verticalSpacing))
        
        currentPoint = CGPoint(x: newXCoordinate, y: newYCoordinate)
        
        if newXCoordinate > self.superViewWidth - 50 {
            
            self.setContentOffset(CGPoint(x: newXCoordinate - 100, y: 0), animated: true)
            
        }
        
    }
    
}
