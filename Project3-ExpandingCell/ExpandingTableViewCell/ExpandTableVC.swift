//
//  ExpandTableVC.swift
//  ExpandingTableViewCell
//
//  Created by Tank Lin on 2016/3/23.
//  Copyright © 2016年 Tanklin Co., Ltd. All rights reserved.
//

import UIKit

let cellID = "cell"

class ExpandTableVC: UITableViewController {
    var selectedIndexPath: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! ExpandTableViewCell
        cell.selectionStyle = .None

        return cell
    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }

        var indexPaths: Array<NSIndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        if indexPaths.count > 0 {
            tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! ExpandTableViewCell).watchFrameChanges()
    }

    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! ExpandTableViewCell).ignoreFrameChanges()
    }


    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            return ExpandTableViewCell.expandedHeight
        }
        return ExpandTableViewCell.defaultHeight
    }


}





