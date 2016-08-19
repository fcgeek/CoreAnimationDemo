//
//  MaskToBoundsViewController.swift
//  CoreAnimationDemo
//
//  Created by liujianlin on 16/8/19.
//  Copyright © 2016年 fcgeek. All rights reserved.
//

import UIKit

class MaskToBoundsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.grayColor()
        let whiteViewSize = CGSize(width: 50, height: 50)
        let whiteView = UIView(frame: CGRect(x: (view.bounds.width-whiteViewSize.width)/2, y: (view.bounds.height-whiteViewSize.height)/2, width: whiteViewSize.width, height: whiteViewSize.height))
        whiteView.backgroundColor = UIColor.whiteColor()
        view.addSubview(whiteView)
        
        let image = UIImage(named: "eyes")
        whiteView.layer.contents = image?.CGImage
        whiteView.layer.contentsGravity = kCAGravityCenter
        whiteView.layer.contentsScale = UIScreen.mainScreen().scale
        whiteView.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
