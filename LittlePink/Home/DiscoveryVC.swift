//
//  DiscoveryVC.swift
//  LittlePink
//
//  Created by 赵蔚 on 2023/10/12.
//

import UIKit
import XLPagerTabStrip

class DiscoveryVC: ButtonBarPagerTabStripViewController{

    override func viewDidLoad() {
        
        // MARK: - 设置上方的Bar UI
        
        // 设置buttonBar
        settings.style.buttonBarMinimumLineSpacing = 10
        settings.style.buttonBarLeftContentInset = 13
        settings.style.buttonBarRightContentInset = 13
        
        settings.style.selectedBarHeight = 0
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 14)
        settings.style.buttonBarItemTitleColor = .label
        
         
        super.viewDidLoad()

        
        containerView.bounces = false
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.secondaryLabel
            newCell?.label.textColor = UIColor.label
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
            
        }
        
    }
    
    
    
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
       
        var viewControllers: [UIViewController] = []
        for channel in kChannels {
            let vc = storyboard!.instantiateViewController(identifier: kWaterfallVCID) as WaterfallVC
            vc.channel = channel
            viewControllers.append(vc)
        }
        return viewControllers
        
    }
    
    


}



extension DiscoveryVC : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        IndicatorInfo(title: "发现")
    }
}
