//
//  FitWrench.swift
//  Graphs
//
//  Created by Aaron Anthony on 2019-06-30.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class ElegantObjects {
    
    func graphs() -> Graphs {
        
        //Recursive Depth 1
        let test1 = UIViewController()
        test1.view.backgroundColor = .red
        let test2 = UIViewController()
        test2.view.backgroundColor = .blue
        let test3 = UIViewController()
        test3.view.backgroundColor = .purple
        
        let pageView = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        //Recursive Depth 2
        let graphPageView = GraphPages(graphs: [test1, test2, test3], pageView: pageView)
        let segControl = SWSegmentControl(items: ["test1", "test2", "test3"])
        
        //Recursive Depth 3
        let foodGraphs = Graphs(graphPages: graphPageView, segControl: segControl)
        return foodGraphs
    }
}
