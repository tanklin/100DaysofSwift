//
//  ExpandTableViewCell.swift
//  ExpandingTableViewCell
//
//  Created by Tank Lin on 2016/3/23.
//  Copyright © 2016年 Tanklin Co., Ltd. All rights reserved.
//

import UIKit

class ExpandTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!

    class var expandedHeight: CGFloat { get { return 200 } }
    class var defaultHeight:  CGFloat { get { return 44  } }

    override func drawRect(rect: CGRect) {
        self.backgroundColor = UIColor.darkGrayColor()
    }

    func checkHeight() {
        datePicker.date = NSDate(timeIntervalSinceNow: 1000)
        datePicker.hidden = (frame.size.height < ExpandTableViewCell.expandedHeight)
    }

    func watchFrameChanges() {
        addObserver(self, forKeyPath: "frame", options: .New, context: nil)
        checkHeight()
    }

    func ignoreFrameChanges() {
//        removeObserver(self, forKeyPath: "frame").
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "frame" {
            checkHeight()
        }
    }
}
