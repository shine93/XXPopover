//
//  ViewController.swift
//  XXPopover
//
//  Created by 人人 on 2018/6/27.
//  Copyright © 2018年 人人. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var blueTipPop : Popover?

    @IBOutlet weak var rightPopBtn: UIButton!
    @IBOutlet weak var clickMeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    @IBAction func popShow(_ sender: Any) {
        let popoverOptions: [PopoverOption] = [
            .type(.right),
            .blackOverlayColor(UIColor(white: 0.0, alpha: 0.0)),
            .arrowSize(CGSize(width: 16, height: 8)),
            .upPadding(20),
            .color(UIColor(red: 35.0 / 255.0, green: 128.0 / 255.0, blue: 245.0 / 255.0, alpha: 1)),
            .cornerRadius(4.0),
            .animationIn(TimeInterval(0.2)),
            .sideEdge(8.0)
        ]
        
        blueTipPop = Popover(options: popoverOptions, showHandler: {
            
        }) {
//            self.blueTipPop?.removeGestureRecognizer(blueTipPlacesGR)
        }
//        let blueTipPlacesGR = UITapGestureRecognizer(target: blueTipPop, action: #selector(blueTipPop?.dismiss))
//        blueTipPop?.addGestureRecognizer(blueTipPlacesGR)
//
        
        let tipLabel = UILabel()
        tipLabel.numberOfLines = 0
        tipLabel.text = "Filter which locations appear on your map with this button"
        tipLabel.textColor = UIColor.white
        tipLabel.frame = CGRect(x: 0, y: 0, width: 176, height: 64)
        tipLabel.font = UIFont.systemFont(ofSize: 12)
        tipLabel.textAlignment = .left
        
        blueTipPop?.show(tipLabel, fromView: rightPopBtn, inView: view)
    }
    
}

