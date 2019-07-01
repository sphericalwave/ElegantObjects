//
//  SWSegmentControl.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-06-30.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

protocol SwSegmentControlDelegate: AnyObject {
    func segmentControl(selected index: Int)
}

class SWSegmentControl: UISegmentedControl {
    
    weak var delegate: SwSegmentControlDelegate?
    
    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(items: [String]) {
        super.init(items: items)
        self.addTarget(self, action: #selector(SWSegmentControl.selectedIndexChanged(sender:)), for: UIControl.Event.valueChanged)
        self.tintColor = SWBlue.opaque
        self.backgroundColor = .clear
        self.selectedSegmentIndex = 0 //FIXME: Inject this value
    }
    
    //TODO: Why is this required to prevent a crash at runtime?
    override init(frame: CGRect) { super.init(frame: frame) }
    
    @objc func selectedIndexChanged(sender: UISegmentedControl) {
        delegate?.segmentControl(selected: sender.selectedSegmentIndex)
    }
}
