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
        
    

        settings.style.buttonBarMinimumLineSpacing = 20
        // buttonBar flow layout left content inset value
        settings.style.buttonBarLeftContentInset = 115
        // buttonBar flow layout right content inset value
        settings.style.buttonBarRightContentInset = 115

        // selected bar view is created programmatically so it's important to set up the following 2 properties properly
//        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarBackgroundColor = .clear
        settings.style.selectedBarHeight = 2

        // each buttonBar item is a UICollectionView cell of type ButtonBarViewCell
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 15)
        // helps to determine the cell width, it represent the space before and after the title label
        settings.style.buttonBarItemLeftRightMargin = 0
        settings.style.buttonBarItemTitleColor = .label
        // in case the barView items do not fill the screen width this property stretch the cells to fill the screen
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        
        
        
        
        //调整selectedBar的position
        let rect = CGRect(x: 0, y: 0, width: 26, height: 2)
        let customSelectedBar = SelectedBarShapView(frame: rect)
        let shapLayer = CAShapeLayer()
        shapLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: 2).cgPath
        shapLayer.fillColor = UIColor(named: "main")?.cgColor
        customSelectedBar.layer.addSublayer(shapLayer)
        buttonBarView.selectedBar.addSubview(customSelectedBar)
        
        customSelectedBar.snp.makeConstraints {
            $0.size.equalTo(rect.size)
            $0.centerY.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview()
        }
        
        
        super.viewDidLoad()

    }
    

    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let followVC = storyboard!.instantiateViewController(identifier: kFollowVCID)
        let discoveryVC = storyboard!.instantiateViewController(identifier: kDiscoveryVCID)
        let nearbyVC = storyboard!.instantiateViewController(identifier: kNearbyVCID)
        
        
      return [followVC, discoveryVC, nearbyVC]
    }
    

    

}
