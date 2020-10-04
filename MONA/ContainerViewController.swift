//
//  ContainerViewController.swift
//  MONA
//
//  Created by Fabian Clasen on 21.09.20.
//  Copyright © 2020 Fabian Clasen. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    let transiton = SlideInTransition()
    var topView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Beim Start die Übersicht anzeigen
        
        //If self.isMember() Is needed because if you do not check what type self is then you would find yourself in a infinite loop due to the 
        //ContainerViewController subclassing in CategoryViewController
        if self.isMember(of: ContainerViewController.self){
            let initialVC = self.storyboard!.instantiateViewController(withIdentifier: "OverviewViewController") as! OverviewViewController
            self.title = "Übersicht" //This can be done in CategoryViewController itself or
            self.add(asChildViewController: initialVC)
        }
    }

    @IBAction func userDidSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            if sender.direction == .right {
                openMenu()
            }
        }
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        openMenu()
    }
    
    func openMenu() {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    func closeMenu() {
        topView?.removeFromSuperview()
    }

    func transitionToNew(_ menuType: MenuType) {
        closeMenu()
        switch menuType {
        case .overview:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "OverviewViewController") as! OverviewViewController
            self.title = "Übersicht"
            self.add(asChildViewController: vc)
        case .expenses:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "ExpensesViewController") as! ExpensesViewController
            self.title = "Ausgaben"
            self.add(asChildViewController: vc)
        case .category:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
            self.title = "Kategorie"
            self.add(asChildViewController: vc)
        case .earnings:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "EarningsViewController") as! EarningsViewController
            self.title = "Einnahmen"
            self.add(asChildViewController: vc)
        case .about:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            self.title = "Über"
            self.add(asChildViewController: vc)
        default:
            break
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        view.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.source is CategoryViewController) {
            let sVc = segue.source as? CategoryViewController
            if(segue.destination is CategoryDetailViewController) {
                if(segue.identifier == "showCategoryForEdit") {
                    let dVc = segue.destination as? CategoryDetailViewController
                    dVc?.categoryName = "Test Segue"
                }
            }
        }
    }
}

extension ContainerViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

