//
//  ViewController.swift
//  testhud
//
//  Created by mohammed on 5/3/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import UIKit
import WSProgressHUD
 
  
//MAKE:- last hud 
var hud: WSProgressHUD?
extension UIViewController {
    func hidHUD (){

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
            hud?.dismiss()
        })
    }
    func showHUDLoder() {
        handleReachability()
        if let nav = navigationController{
            hud = WSProgressHUD(view: nav.view)
        }else if let tab = tabBarController {
            hud = WSProgressHUD(view: tab.view)
        }else{
            hud = WSProgressHUD(view: UIViewController().view)
        }

        func viewWillAppear(_ animated: Bool) {
            hidHUD ()
        }

        if let hud = hud {
            view.addSubview(hud)
            //            tabBarController.
        }
        hud?.show(with: .clear)
    }
    func showHUD(title:String? = nil , details: String? = nil) {

        var hud: WSProgressHUD?
        if let nav = navigationController{
            hud = WSProgressHUD(view: nav.view)
        }else if let tab = tabBarController {
            hud = WSProgressHUD(view: tab.view)
        }else{
            hud = WSProgressHUD(view: UIViewController().view)
        }
        if let hud = hud {
            view.addSubview(hud)
        }
        (title != nil) ?  hud?.show(nil, status: "\(title ?? "")\n\(details ?? "")", maskType: .clear) : hud?.show(nil, status: "\(details ?? "")", maskType: .clear)
    }
    func showHUDAnimtionTitel(_ titel : String, hideAfter:TimeInterval? = nil){
        var hud: WSProgressHUD?
        if let nav = navigationController{
            hud = WSProgressHUD(view: nav.view)
        }else if let tab = tabBarController {
            hud = WSProgressHUD(view: tab.view)
        }else{
            hud = WSProgressHUD(view: UIViewController().view)
        }

        if let hud = hud {
            view.addSubview(hud)
        }
        hud?.showShimmeringString(titel, maskType: .clear)

        DispatchQueue.main.asyncAfter(deadline: .now() + ((hideAfter == nil) ? 2 : hideAfter ?? 2) ) {
            if !hud!.accessibilityElementsHidden{
                hud?.dismiss()
            }
        }


    }
}
 
