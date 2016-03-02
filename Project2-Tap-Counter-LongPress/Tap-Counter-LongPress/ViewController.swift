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
    var longPressGesture = UILongPressGestureRecognizer()

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
        button.setTitle("Tap or Hold me to + ☕️", forState: UIControlState.Normal)
        button.tintColor = UIColor.whiteColor()
        button.titleLabel!.font = UIFont.boldSystemFontOfSize(22)
        button.addTarget(self, action: "tapAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)

        longPressGesture = UILongPressGestureRecognizer(target: self, action: "tapAction:")
        longPressGesture.allowableMovement = 100
        button.addGestureRecognizer(longPressGesture)
    }


    func tapAction(sender:UIButton!) {
        number += 1
        print(">>> \(number)")
        label.text = "\(number) cup of ☕️"
        worningYouDrinkTooMuch()
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

    func worningYouDrinkTooMuch() {
        if number % 100 == 0 {
            alertController("Worning!!!", actionTitle: "OK, I got it")
        }

        if number == 1000 {
            alertController("OMG! INCREDIBLE!!!", actionTitle: "NO, I NEVER STOP IT")
        }
    }

    func alertController(title:String?, actionTitle:String?) {
        let alertView = UIAlertController(title: title, message: "You have drunk \(number) cup of ☕️ !!!", preferredStyle: UIAlertControllerStyle.Alert)

        let action = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.Default, handler: nil)
        alertView.addAction(action)
        self.presentViewController(alertView, animated: true, completion: nil)
    }
}

