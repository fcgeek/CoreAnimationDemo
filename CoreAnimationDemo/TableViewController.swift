//
//  TableViewController.swift
//  CoreAnimationDemo
//
//  Created by liujianlin on 16/8/19.
//  Copyright © 2016年 fcgeek. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private var dataSource = ["Layer Three":["Layer Three"],
                              "Backing Image":["Contents Image", "Contents Gravity", "Contents Scale", "MasksToBounds", "Contents Rect", "Contents Center", "Custom Drawing"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.keys.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let index = dataSource.startIndex.advancedBy(section)
        let key = dataSource.keys[index]
        guard let array = dataSource[key] else { return 0 }
        return array.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let index = dataSource.startIndex.advancedBy(section)
        let key = dataSource.keys[index]
        return key
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        // Configure the cell...
        let index = dataSource.startIndex.advancedBy(indexPath.section)
        let key = dataSource.keys[index]
        guard let array = dataSource[key] else { return cell }
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var vc: UIViewController?
        let index = dataSource.startIndex.advancedBy(indexPath.section)
        let key = dataSource.keys[index]
        guard let array = dataSource[key] else { return }
        switch array[indexPath.row] {
        case "Layer Three": vc = LayerThreeViewController()
        case "Contents Image": vc = ContentsImageViewController()
        case "Contents Gravity": vc = ContentsGravityViewController()
        case "Contents Scale": vc = ContentsScaleViewController()
        case "MasksToBounds": vc = MaskToBoundsViewController()
        case "Contents Rect": vc = ContentsRectViewController()
        case "Contents Center": vc = ContentsCenterViewController()
        case "Custom Drawing": vc = CustomeDrawingViewController()
            
        default: break
        }
        guard let goVC = vc else { return }
        goVC.title = array[indexPath.row]
        navigationController?.pushViewController(goVC, animated: true)
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


//用于标记枚举类型为Int可以获得count
protocol CaseCountable {
    /**
     自动获取枚举类型为Int，从0开始的count
     
     */
    static var count: Int { get }
}


// provide a default implementation to count the cases for Int enums assuming starting at 0 and contiguous
extension CaseCountable where Self : RawRepresentable, Self.RawValue == Int {
    /**
     自动获取枚举类型为Int，从0开始的count
     */
    static var count: Int {
        get {
            var count = 0
            while let _ = Self(rawValue: count) { count+=1 }
            return count
        }
    }
}
