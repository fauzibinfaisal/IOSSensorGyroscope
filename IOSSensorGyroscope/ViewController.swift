//
//  ViewController.swift
//  IOSSensorGyroscope
//
//  Created by Fauzi Fauzi on 07/07/19.
//  Copyright © 2019 Fauzi. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    @IBOutlet weak var spinXLabel: UILabel!
    @IBOutlet weak var spinYLabel: UILabel!
    @IBOutlet weak var valueXLabel: UILabel!
    @IBOutlet weak var valueYLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func startAction(_ sender: UIButton) {
        if motionManager.isGyroAvailable{
            //TODO : Set interval updated in second
            motionManager.gyroUpdateInterval = 0.1
            motionManager.startGyroUpdates(to: OperationQueue.main) { (data, error) in
                print(data!)
                
                if (data!.rotationRate.x > 0.5){
                    self.spinXLabel.text = "X-axis: SPIN UP"
                } else if (data!.rotationRate.x < -0.5){
                    self.spinXLabel.text = "X-axis: SPIN DOWN"
                } else if (data!.rotationRate.y > 0.5){
                    self.spinYLabel.text = "Y-axis: SPIN RIGHT"
                } else if (data!.rotationRate.y < -0.5){
                    self.spinYLabel.text = "Y-axis: SPIN LEFT"
                } else{
                    self.spinXLabel.text = "X-axis: SPIN ME!"
                    self.spinYLabel.text = "Y-axis: SPIN ME!"
                }
                

                self.valueXLabel.text = String(format: "%.3f", (data?.rotationRate.x)!)
                self.valueYLabel.text = String(format: "%.3f", (data?.rotationRate.y)!)
                
            }
        }
    }
    
    
    @IBAction func stopAction(_ sender: UIButton) {
        motionManager.stopGyroUpdates()
    }
    
}

