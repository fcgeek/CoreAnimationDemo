//
//  ContentsRectViewController.swift
//  CoreAnimationDemo
//
//  Created by liujianlin on 16/8/19.
//  Copyright © 2016年 fcgeek. All rights reserved.
//

import UIKit

class ContentsRectViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.grayColor()
        let view1 = UIView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        let view2 = UIView(frame: CGRect(x: 102, y: 110, width: 100, height: 100))
        let view3 = UIView(frame: CGRect(x: 15, y: 220, width: 100, height: 100))
        let view4 = UIView(frame: CGRect(x: 115, y: 225, width: 100, height: 100))
        let image = UIImage(named: "merge")!
        addSpriteImage(image, contentRect: CGRect(x: 0, y: 0, width: 0.5, height: 0.5), toLayer: view1.layer)
        addSpriteImage(image, contentRect: CGRect(x: 0.5, y: 0, width: 0.5, height: 0.5), toLayer: view2.layer)
        addSpriteImage(image, contentRect: CGRect(x: 0, y: 0.5, width: 0.5, height: 0.5), toLayer: view3.layer)
        addSpriteImage(image, contentRect: CGRect(x: 0.5, y: 0.5, width: 0.5, height: 0.5), toLayer: view4.layer)
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
    }
    
    private func addSpriteImage(image: UIImage, contentRect rect: CGRect, toLayer layer:(CALayer)) {
        layer.contents = image.CGImage
        layer.contentsGravity = kCAGravityResizeAspect
        layer.contentsRect = rect
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
