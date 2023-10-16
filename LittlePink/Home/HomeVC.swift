//
//  HomeVC.swift
//  LittlePink
//
//  Created by 赵蔚 on 2023/10/12.
//

import UIKit
import XLPagerTabStrip
import SnapKit

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        
    
        
        // MARK: - 设置上方的Bar UI
        

        // 设置buttonBar
        settings.style.buttonBarMinimumLineSpacing = 20
        settings.style.buttonBarLeftContentInset = 115
        settings.style.buttonBarRightContentInset = 115

        //设置selectedBar
        settings.style.selectedBarBackgroundColor = .clear
        settings.style.selectedBarHeight = 2
        
        //设置buttonBarItem
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 15)
        settings.style.buttonBarItemLeftRightMargin = 0
        settings.style.buttonBarItemTitleColor = .label
        
        //调整selectedBar的position
        let rect = CGRect(x: 0, y: 0, width: 26, height: 2)
        let customSelectedBar = SelectedBarShapView(frame: rect)
        buttonBarView.selectedBar.addSubview(customSelectedBar)
        
        customSelectedBar.snp.makeConstraints {
            $0.size.equalTo(rect.size)
            $0.centerY.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview()
        }
        
        
        super.viewDidLoad()
        
        containerView.bounces = false
        
        //设置选中的颜色
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = UIColor.secondaryLabel
            newCell?.label.textColor = UIColor.label

            //动画
//            if animated {
//                UIView.animate(withDuration: 0.1, animations: { () -> Void in
//                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
//                })
//            }
//            else {
//                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
//            }
        }
        
        
        DispatchQueue.main.async {
            self.moveToViewController(at: 1, animated: false)
        }
        
        
        

    }
    
    

    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(identifier: kFollowVCID)
        let discoveryVC = storyboard!.instantiateViewController(identifier: kDiscoveryVCID)
        let nearbyVC = storyboard!.instantiateViewController(identifier: kNearbyVCID)
        return [followVC, discoveryVC, nearbyVC]
    }
    

    

}
