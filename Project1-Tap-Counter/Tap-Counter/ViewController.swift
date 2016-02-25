//
//  ViewController.swift
//  Tap-Counter
//
//  Created by Tank Lin on 2016/2/25.
//  Copyright © 2016年 womany.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number = 0
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton()
        addLabel()
        addNavBar()
    }

    func addButton() {
        let button = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(0, CGRectGetHeight(view.bounds)*0.85, CGRectGetWidth(view.bounds), 80)
        button.backgroundColor = UIColor.brownColor()
        button.setTitle("Tap me to + ☕️", forState: UIControlState.Normal)
        button.tintColor = UIColor.whiteColor()
        button.titleLabel!.font = UIFont.boldSystemFontOfSize(22)
        button.addTarget(self, action: "tapAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }


    func tapAction(sender:UIButton!) {
        number += 1
        print(">>> \(number)")
        label.text = "\(number) cup of ☕️"
    }


    func addLabel() {
        label.frame = CGRectMake(0, 150, CGRectGetWidth(view.bounds), 200)
        label.backgroundColor = UIColor.clearColor()
        label.text = "\(number) cup of ☕️"
        label.tintColor = UIColor.blackColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.boldSystemFontOfSize(50)

        self.view.addSubview(label)
    }


    func addNavBar() {
        self.title = "Today I have drunk..."

        let leftButton = UIBarButtonItem(title:"Reset", style: .Plain, target: self, action: "tapLeftButton:")
        self.navigationItem.leftBarButtonItem = leftButton
    }


    func tapLeftButton(sender:UIBarButtonItem) {
        number = 0
        print("Reset: \(number)")
        label.text = "\(number) cup of ☕️"
    }
}

