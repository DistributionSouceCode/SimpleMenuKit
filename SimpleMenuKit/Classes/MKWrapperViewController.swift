//
//  MKWrapperViewController.swift
//  Pods-SimpleMenuKit_Example
//
//  Created by Hiem Seyha on 3/14/18.
//

import UIKit
import QuartzCore

public typealias MKHomeViewControllerType = (UIViewController & MKHomeViewControllerDelegate)
public typealias ResolverLeftVC = () -> UIViewController

public class MKWrapperViewController: UIViewController {
   
   var mkHomeViewController: MKHomeViewControllerType?
   var mkLeftViewController: UIViewController?
   var mkCenterController: UIViewController!
   var resolverLeftVC: ResolverLeftVC!
   
   var isHidden = false
   var tap: UITapGestureRecognizer!
   
   var menuStyle: MenuStyle = .viewController
   var mkNaviagtionController: UINavigationController?
   
   // MAKR: Configuration Appearance
   var centerPanelExpandedOffset: CGFloat = 150
   
   
   var currentState:SlideOutState = .collapse {
      didSet {
         let _ = (currentState != .collapse)
      }
   }
   
   public init(_ resolverLeftVC: @escaping ResolverLeftVC, mkHomeViewController: MKHomeViewControllerType,  type: MenuStyle = .viewController) {
      super.init(nibName: nil, bundle: nil)
   
      self.resolverLeftVC = resolverLeftVC
      self.mkHomeViewController = mkHomeViewController
      self.mkHomeViewController?.menuDelegate = self

      if type == .navigation {
         mkNaviagtionController = UINavigationController(rootViewController: mkHomeViewController)
      }
      
   }
   
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override public func viewDidLoad() {
      super.viewDidLoad()

      view.backgroundColor = .white

      initCenterViewController(screen: .homeVC)
   }


   func initCenterViewController(screen: ShowWhichVC) {

      var presentingViewController: UIViewController

      presentingViewController = mkHomeViewController!

      if let con = mkCenterController {
         con.view.removeFromSuperview()
         con.removeFromParentViewController()
      }

      mkCenterController = presentingViewController

      if menuStyle == .navigation {
         view.addSubview((mkNaviagtionController?.view)!)
         addChildViewController(mkNaviagtionController!)
      } else {
         view.addSubview((mkHomeViewController?.view)!)
         addChildViewController(mkCenterController)
      }

      didMove(toParentViewController: self)

   }
}


extension MKWrapperViewController : MKActionViewControllerDelegate {

   @objc public func toggleLeftPanel() {
      let notAlreadyExpanded = (currentState != .leftPanelExpanded)

      if notAlreadyExpanded {
         addLeftPanelViewController()
      }

      animateLeftPanel(shouldExpand: notAlreadyExpanded)
   }

   public func addLeftPanelViewController() {
      if mkLeftViewController == nil {
         mkLeftViewController = resolverLeftVC()
         addChildSlidePanelViewController(sidePanelViewController: mkLeftViewController!)
      }

   }

   func addChildSlidePanelViewController(sidePanelViewController: UIViewController) {

      view.insertSubview(sidePanelViewController.view, at: 0)
      addChildViewController(sidePanelViewController)
      sidePanelViewController.didMove(toParentViewController: self)
   }

   @objc public func animateLeftPanel(shouldExpand: Bool) {
      if shouldExpand {
         isHidden = !isHidden
         animateStatusBar()
         setupWhiteCoverView()
         currentState = .leftPanelExpanded
         animateCenterPanelXPosition(targetPosition: mkCenterController.view.frame.width - centerPanelExpandedOffset)
      } else {
         isHidden = !isHidden
         animateStatusBar()
         hideWhiteCoverView()
         animateCenterPanelXPosition(targetPosition: 0, completion: { [weak self] (finished) in
            if finished == true {
               self?.currentState = .collapse
               self?.mkLeftViewController?.view.removeFromSuperview()
               self?.mkLeftViewController?.removeFromParentViewController()
               self?.mkLeftViewController = nil
            }
         })
      }
   }

   func animateCenterPanelXPosition(targetPosition: CGFloat, completion:((Bool)->Void)! = nil) {

      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in

         if self?.menuStyle == .navigation {
            self?.mkNaviagtionController?.view.frame.origin.x = targetPosition
         } else {
            self?.mkHomeViewController?.view.frame.origin.x = targetPosition
         }

         }, completion: completion)
   }

   func animateStatusBar() {
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
         self.setNeedsStatusBarAppearanceUpdate()
      })
   }

   func setupWhiteCoverView() {
      let whiteCoverView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
      whiteCoverView.alpha = 0.0
      whiteCoverView.tag = 25
      whiteCoverView.backgroundColor = UIColor.black
      self.mkCenterController.view.addSubview(whiteCoverView)

      // FIXME: Bug Not Yet support with iphone 5 down
      tap = UITapGestureRecognizer(target: self, action: #selector(animateLeftPanel(shouldExpand:)))

      tap.numberOfTapsRequired = 1
      self.mkCenterController.view.addGestureRecognizer(tap)
   }

   func hideWhiteCoverView() {
      self.mkLeftViewController?.view.removeGestureRecognizer(tap)
      for subview in self.mkCenterController.view.subviews {
         if subview.tag == 25 {
            UIView.animate(withDuration: 0.2, animations: {
               subview.alpha = 0
            }, completion: { (finish) in
               if finish == true {
                  subview.removeFromSuperview()
               }
            })
         }
      }
   }
}
