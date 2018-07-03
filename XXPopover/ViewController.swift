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
    
    @IBOutlet weak var leftPopBtn: UIButton!
    
    @IBOutlet weak var downPopBtn: UIButton!
    
    @IBOutlet weak var upPopBtn: UIButton!
    @IBOutlet weak var rightPopToTopConstraint: NSLayoutConstraint!
    
    var popoverOptions: [PopoverOption]!
    
    let tipLabel = UILabel()
    var popType : PopoverType = .right
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func popTypeChange(ptype: PopoverType) -> [PopoverOption] {
        let popType : [PopoverOption] =  [
            .type(ptype),
            .blackOverlayColor(UIColor(white: 0.0, alpha: 0.0)),
            .arrowSize(CGSize(width: 16, height: 8)),
            .upPadding(20),
            .color(UIColor(red: 35.0 / 255.0, green: 128.0 / 255.0, blue: 245.0 / 255.0, alpha: 1)),
            .cornerRadius(4.0),
            .animationIn(TimeInterval(0.2)),
            .sideEdge(8.0)
        ]
        return popType
    }
    
    func configureUI() {
        //tipLabel
        tipLabel.numberOfLines = 0
        tipLabel.text = "Filter which locations appear on your map with this button"
        tipLabel.textColor = UIColor.white
        tipLabel.frame = CGRect(x: 0, y: 0, width: 176, height: 64)
        tipLabel.font = UIFont.systemFont(ofSize: 12)
        tipLabel.textAlignment = .left
    }
   
    @IBAction func popShow(_ sender: Any) {
        
        if blueTipPop != nil {
            blueTipPop?.removeFromSuperview()
            blueTipPop = nil
        }
        
        popoverOptions = popTypeChange(ptype: .right)
//        blueTipPop = Popover(options: popoverOptions)
        blueTipPop = Popover(options: popoverOptions, showHandler: nil, dismissHandler: nil)
        
        //blockOverlay = false 时，点击pop本身不会dimiss
//        blueTipPop?.show(tipLabel, fromView: rightPopBtn, inView: view)
        blueTipPop?.show(tipLabel, fromView: rightPopBtn, inView: view, blockOverlay: false)
    }
    
    
    @IBAction func leftPopShow(_ sender: Any) {
        if blueTipPop != nil {
            blueTipPop?.removeFromSuperview()
            blueTipPop = nil
        }
        popoverOptions = popTypeChange(ptype: .left)
        blueTipPop = Popover(options: popoverOptions)
        
        blueTipPop?.show(tipLabel, fromView: leftPopBtn, inView: view, blockOverlay: false)

    }
    
    @IBAction func downPopShow(_ sender: Any) {
        if blueTipPop != nil {
            blueTipPop?.removeFromSuperview()
            blueTipPop = nil
        }
        popoverOptions = popTypeChange(ptype: .down)
        blueTipPop = Popover(options: popoverOptions)
        
        blueTipPop?.show(tipLabel, fromView: downPopBtn, inView: view, blockOverlay: false)

    }
    
    @IBAction func upPopShow(_ sender: Any) {
        if blueTipPop != nil {
            blueTipPop?.removeFromSuperview()
            blueTipPop = nil
        }
        popoverOptions = popTypeChange(ptype: .up)
        blueTipPop = Popover(options: popoverOptions)
        
        blueTipPop?.show(tipLabel, fromView: upPopBtn, inView: view, blockOverlay: false)

    }
}

