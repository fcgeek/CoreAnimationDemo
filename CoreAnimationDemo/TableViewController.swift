//
//  TableViewController.swift
//  CoreAnimationDemo
//
//  Created by liujianlin on 16/8/19.
//  Copyright © 2016年 fcgeek. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private enum RowType: Int, CaseCountable {
        case LayerThree=0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RowType.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        // Configure the cell...
        let rowType = RowType(rawValue: indexPath.row)!
        switch rowType {
        case .LayerThree:
            cell.textLabel?.text = "LayerThree"
            
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch RowType(rawValue: indexPath.row)! {
        case .LayerThree:
            navigationController?.pushViewController(LayerThreeViewController(), animated: true)
            
        }
        
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
