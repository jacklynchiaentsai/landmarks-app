//
//  PageViewController.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/19/23.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable{
    // an array of page instances use to scroll between landmarks
    var pages: [Page]
    @Binding var currentPage: Int
    
    // SwiftUI calls make coordinator befor makeuiview so that have access to coordinator object first
    // can use coordinator to implement common Cocoa patterns
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // swift calls this method a single time when it's ready to display the view, and then manages the view controller's life cycle
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    // data spirce
    class Coordinator: NSObject , UIPageViewControllerDataSource, UIPageViewControllerDelegate{
        var parent: PageViewController
        // initailize an array of controllers
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map {UIHostingController(rootView: $0)}
        }
        
        // two methods establish the relationships between view controllers so that user can swipe back and forth
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }


        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        // SwiftUI calls this method whenever a page switching animation completes, you can find the index of the current view controller and update the binding
        func pageViewController(
                    _ pageViewController: UIPageViewController,
                    didFinishAnimating finished: Bool,
                    previousViewControllers: [UIViewController],
                    transitionCompleted completed: Bool) {
                    if completed,
                       let visibleViewController = pageViewController.viewControllers?.first,
                       let index = controllers.firstIndex(of: visibleViewController) {
                        parent.currentPage = index
                    }
                }
    }
}
