//
//  FollowVC.swift
//  LittlePink
//
//  Created by 赵蔚 on 2023/10/12.
//

import UIKit
import XLPagerTabStrip

class FollowVC: UIViewController,  IndicatorInfoProvider{


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        IndicatorInfo(title: "关注")
    }
    

}
