//
//  ViewController.swift
//  MONA
//
//  Created by Fabian Clasen on 21.09.20.
//  Copyright © 2020 Fabian Clasen. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController {

    let transiton = SlideInTransition()
    var topView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }

    func transitionToNew(_ menuType: MenuType) {
        topView?.removeFromSuperview()
        switch menuType {
        case .overview:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "OverviewViewController") as! OverviewViewController
            self.view.addSubview(vc.view)
            self.title = "Übersicht"
        case .expenses:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "ExpensesViewController") as! ExpensesViewController
            self.view.addSubview(vc.view)
            self.title = "Ausgaben"
        case .category:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
            self.view.addSubview(vc.view)
            self.title = "Kategorien"
        case .earnings:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "EarningsViewController") as! EarningsViewController
            self.view.addSubview(vc.view)
            self.title = "Einnahmen"
        case .about:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            self.view.addSubview(vc.view)
            self.title = "Über"
        default:
            break
        }
    }

}

extension OverviewViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

