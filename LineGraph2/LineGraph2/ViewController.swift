//
//  ViewController.swift
//  LineGraph2
//
//  Created by GDB Technologies on 06/03/17.
//  Copyright © 2017 GDB Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lineGraphView: LineGraph!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // BG, axis colors
        
        self.lineGraphView.lineViewBGColor = UIColor.white
        
        self.lineGraphView.XYAxixColor = UIColor.black
        
        self.lineGraphView.otherLinesColor = UIColor.init(red: (240/255.0), green: (71/255.0), blue: (66/255.0), alpha: 1.0)
        
        self.lineGraphView.ecgSignalColor = UIColor.black
        
        // Line Width
        
        self.lineGraphView.ecgSignalLineWidth = 1.0
        
        self.lineGraphView.lineWidth = 0.2
        
        // Superview Frame
        
        self.lineGraphView.superViewWidth = self.lineGraphView.frame.size.width
        
        self.lineGraphView.superViewHeight = self.lineGraphView.frame.size.height
        
        // Line graph start Points
        
        self.lineGraphView.graphX = 30.0
        
        self.lineGraphView.graphYUp = 30.0
        
        self.lineGraphView.graphYDown = 30.0
        
        // Iteration Limit
        
        self.lineGraphView.horizontalLinesIterationCount = 100
        
        self.lineGraphView.verticalLinesIterationCount = 100
        
        // Spacing between lines
        
        self.lineGraphView.horizontalSpacing = 10.0
        
        self.lineGraphView.verticalSpacing = 10.0
        
        // Padding
        
        self.lineGraphView.padding = 30.0
        
        self.lineGraphView.createLineGraph(frame: self.lineGraphView.frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

