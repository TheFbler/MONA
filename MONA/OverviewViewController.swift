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
        guard let overviewViewController = storyboard?.instantiateViewController(withIdentifier: "OverviewView") as? MenuViewController else { return }
        overviewViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        overviewViewController.modalPresentationStyle = .overCurrentContext
        overviewViewController.transitioningDelegate = self
        present(overviewViewController, animated: true)
    }

    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title

        topView?.removeFromSuperview()
        switch menuType {
        case .profile:
            let view = UIView()
            view.backgroundColor = .yellow
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .camera:
            let view = UIView()
            view.backgroundColor = .blue
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
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

