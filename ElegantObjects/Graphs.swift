//
//  FoodGraphs.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2018-07-23.
//  Copyright © 2018 SphericalWave. All rights reserved.
//
//  Purpose: Present GraphSlider and SegmentedControl

import UIKit
import CoreData

class Graphs: UIViewController {
    
    @IBOutlet var pagesContainer: UIView!
    @IBOutlet weak var segContainer: UIView!
    let graphPageView: GraphPages //TODO: Rename to graphSlider
    let segControl: SWSegmentControl
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    init(graphPages: GraphPages, segControl: SWSegmentControl) {
        self.graphPageView = graphPages
        self.segControl = segControl
        super.init(nibName: "Graphs", bundle: nil)
        segControl.delegate = self
    }

    override func loadView() {
        super.loadView()
        self.embed(viewController: graphPageView.pageView, inContainerView: pagesContainer)
        segControl.frame = segContainer.bounds //FIXME:: i don't know the frame at construction
        segContainer.addSubview(segControl)
        segContainer.backgroundColor = .white
    }
}

extension Graphs: SwSegmentControlDelegate {
    func segmentControl(selected index: Int) {
        graphPageView.showGraph(at: index)
    }
}
