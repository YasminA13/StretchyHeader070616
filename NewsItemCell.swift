//
//  NewsItemCell.swift
//  StretchHeader070616
//
//  Created by Yasmin Ahmad on 2016-06-07.
//  Copyright © 2016 YasminA. All rights reserved.
//

import UIKit

var headerView: UIView!
var headerMaskLayer: CAShapeLayer!

let items = [
    NewsItem(category: .World, summary: "Climate change protests, divestments meet fossil fuel realities"),
    NewsItem(category: .Europe, summary: "Scotland's 'Yes' leader says independant vote is 'once in a lifetime'"),
    NewsItem(category: .MiddleEast, summary: "Airstrikes boots Islamic State, FBI director warns more hostages possible"),
    NewsItem(category: .Africa, summary: "Nigeria says 90 dead in building collapse; questions S. Africa victim claim"),
    NewsItem(category: .AsiaPacific, summary: "Despite UN ruling, Japan seeks backing for whale hunting"),
    NewsItem(category: .Americas, summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
    NewsItem(category: .World, summary: "South Africa in $40 billion deal for Russian nuclear reactors"),
    NewsItem(category: .Europe, summary: "'One million babies created by EU student exchanges"),
]

class NewsItemCell: UITableViewCell {

    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var newsItem: NewsItem? {
        didSet {
            
            if let item = newsItem {
                categoryLabel.text = item.category.toString()
                categoryLabel.textColor = item.category.toColor()
                summaryLabel.text = item.summary
            }
            else {
                categoryLabel.text = nil
                summaryLabel.text = nil
            }
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
