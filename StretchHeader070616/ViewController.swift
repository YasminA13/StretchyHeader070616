//
//  ViewController.swift
//  StretchHeader070616
//
//  Created by Yasmin Ahmad on 2016-06-07.
//  Copyright © 2016 YasminA. All rights reserved.
//

import UIKit

private let kTableHeaderHeight: CGFloat = 300.0
private let kTableHeaderCutAway: CGFloat = 80.0
let currentDate = NSDate()
let dateFormatter = NSDateFormatter()


class ViewController: UITableViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        let convertedDate = dateFormatter.stringFromDate(currentDate)
        dateLabel.text = convertedDate
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blackColor().CGColor
        
        headerView.layer.mask = headerMaskLayer
        updateHeaderView()
        
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
    }

    func updateHeaderView() {
//        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
//        if tableView.contentOffset.y <  -kTableHeaderHeight{
//            headerRect.origin.y = tableView.contentOffset.y
//            headerRect.size.height = -tableView.contentOffset.y
//        }
//        
        
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        
                let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight{
            headerRect.origin.y  = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + kTableHeaderCutAway/2
            
        }
        
        path.addLineToPoint(CGPoint(x: headerRect.width, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x: 0, y: headerRect.height-kTableHeaderCutAway))
        headerMaskLayer?.path = path.CGPath
        

        
            headerView.frame = headerRect
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK: UITableViewDelegate
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsItemCell
        cell.newsItem = item
        return cell
    }
}
