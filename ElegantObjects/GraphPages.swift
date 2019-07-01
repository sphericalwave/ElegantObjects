//
//  GraphsPageView.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-03-04.
//  Copyright © 2019 SphericalWave. All rights reserved.
//
//  Purpose: To Present an Array of Graphs
//

import UIKit

//FIXME: What is a better name?
final class GraphPages: NSObject {
    
    fileprivate let graphs: [UIViewController]
    fileprivate var selectedIndex: Int = 0  //FIXME: Remove State Inject it
    let pageView: UIPageViewController
    
    init(graphs: [UIViewController], pageView: UIPageViewController) {
        self.graphs = graphs
        self.pageView = pageView
        
        pageView.setViewControllers([graphs[0]], direction: .forward, animated: true, completion: nil)
        pageView.view.isUserInteractionEnabled = true  //FIXME: Can't swipe
        super.init()
        pageView.dataSource = self
        pageView.delegate = self
    }
    
    func showGraph(at index: Int) {
        let graph = [ graphs[index] ]
        if index > selectedIndex {
            pageView.setViewControllers(graph, direction: .forward, animated: true, completion: nil)
        }
        if index < selectedIndex {
            pageView.setViewControllers(graph, direction: .reverse, animated: true, completion: nil)
        }
        selectedIndex = index
    }
}

//MARK: - Delegate
extension GraphPages: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guard let currentVC = pageViewController.viewControllers?[0] else { fatalError("No Current VC")}
            guard let currentIndex = graphs.index(of: currentVC) else { fatalError("No VC found") }
            self.selectedIndex = currentIndex
            //FIXME: Update SegmentedControl
        }
    }
}

//MARK: - Datasource
extension GraphPages: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if selectedIndex == 0 { //@ begining of stack
            return nil
        } else {
            return graphs[selectedIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if selectedIndex == graphs.count { //@ end of stack
            return nil
        } else {
            return graphs[selectedIndex + 1]
        }
    }
}
