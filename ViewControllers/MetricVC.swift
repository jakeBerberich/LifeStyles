//
//  MetricVC.swift
//  LifeStyles01
//
//  Created by Jake Berberich on 12/9/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import UIKit

class MetricVC: UIViewController {
    
   var  sendBackToSegue: String  = "sending you from metric segue"
    
    @IBOutlet weak var inboundMetric: UILabel!
    @IBOutlet weak var returnMatrixText: UITextField!
    @IBOutlet weak var returnToPage: UIButton!
    
    var metricString: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
print(metricString)
        print(#function)
        inboundMetric.text = metricString
      
    }

   

}
