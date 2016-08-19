//
//  ContentsCenterViewController.swift
//  CoreAnimationDemo
//
//  Created by liujianlin on 16/8/19.
//  Copyright © 2016年 fcgeek. All rights reserved.
//

import UIKit

class ContentsCenterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.grayColor()
        let view1 = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 200))
        let view2 = UIView(frame: CGRect(x: 100, y: 350, width: 200, height: 50))
        let image = UIImage(named: "WechatIMG2")!
        addStretchableImage(image, contentCenter: CGRect(x: 0.3, y: 0.3, width: 0.2, height: 0.2), toLayer: view1.layer)
        addStretchableImage(image, contentCenter: CGRect(x: 0.3, y: 0.3, width: 0.2, height: 0.2), toLayer: view2.layer)
        view.addSubview(view1)
        view.addSubview(view2)
    }
    
    private func addStretchableImage(image: UIImage, contentCenter rect: CGRect, toLayer layer:(CALayer)) {
        layer.contents = image.CGImage
        layer.contentsCenter = rect
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
