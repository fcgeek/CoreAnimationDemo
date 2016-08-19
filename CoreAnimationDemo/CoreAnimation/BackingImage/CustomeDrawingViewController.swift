//
//  CustomeDrawingViewController.swift
//  CoreAnimationDemo
//
//  Created by liujianlin on 16/8/19.
//  Copyright © 2016年 fcgeek. All rights reserved.
//

import UIKit

class CustomeDrawingViewController: UIViewController {
    
    private let blueLayer = CALayer()
    
    deinit {
        blueLayer.delegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.grayColor()
        let whiteViewSize = CGSize(width: 200, height: 200)
        let whiteView = UIView(frame: CGRect(x: (view.bounds.width-whiteViewSize.width)/2, y: (view.bounds.height-whiteViewSize.height)/2, width: whiteViewSize.width, height: whiteViewSize.height))
        whiteView.backgroundColor = UIColor.whiteColor()
        view.addSubview(whiteView)
        
        blueLayer.frame = CGRect(x: whiteViewSize.height/4, y: whiteViewSize.height/4, width: whiteViewSize.height/2, height: whiteViewSize.height/2)
        blueLayer.backgroundColor = UIColor.blueColor().CGColor
        blueLayer.delegate = self
        blueLayer.contentsScale = UIScreen.mainScreen().scale
        
        whiteView.layer.addSublayer(blueLayer)
        blueLayer.display()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func drawLayer(layer: CALayer, inContext ctx:CGContextRef) {
        //draw a thick red circle
        CGContextSetLineWidth(ctx, 10.0);
        CGContextSetStrokeColorWithColor(ctx, UIColor.redColor().CGColor);
        CGContextStrokeEllipseInRect(ctx, layer.bounds);
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
