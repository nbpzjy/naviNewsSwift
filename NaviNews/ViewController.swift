//
//  ViewController.swift
//  NaviNews
//
//  Created by YY's MacBook Pro on 2017/5/20.
//  Copyright © 2017年 YY's MacBook Pro. All rights reserved.
//

import UIKit
import Moya
import PageMenu


class ViewController: UIViewController {
    var pageMenu : CAPSPageMenu!
    var controllers :[UIViewController] = []
    
    func showMenu() {
        Category.request { (cates) in
            //            self.resultLable.text = "返回成功，类别数目： "+cates!.count.description
            //            print(cates)
            self.controllers = cates! .map{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SBID.NEWSLIST") as! NewsListController
                vc.title = $0.title
                return vc
                
            }
            let param : [CAPSPageMenuOption] = [
                .menuItemSeparatorWidth(4.3),
                .scrollMenuBackgroundColor(UIColor.darkGray),
                .viewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
                .bottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
                .selectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
                .menuMargin(20.0),
                .menuHeight(40.0),
                .selectedMenuItemLabelColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)),
                .unselectedMenuItemLabelColor(UIColor(red: 180/255.0, green: 180/255.0, blue: 200/255.0, alpha: 1.0)),
                .menuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
                .useMenuLikeSegmentedControl(false),
                .menuItemSeparatorRoundEdges(true),
                .selectionIndicatorHeight(2.0),
                .menuItemSeparatorPercentageHeight(0.1)
            ]
            let fram = CGRect(x: 0, y: 20+44, width: self.view.frame.width, height: self.view.frame.height-20-44)
            
            self.pageMenu = CAPSPageMenu(viewControllers: self.controllers, frame: fram, pageMenuOptions: param)
            self.view.addSubview(self.pageMenu.view)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

