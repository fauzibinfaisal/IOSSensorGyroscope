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
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var valueXLabel: UILabel!
    @IBOutlet weak var valueYLabel: UILabel!
    @IBOutlet weak var valueZLabel: UILabel!
    
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
                
                if ((data!.rotationRate.x > 1)||(data!.rotationRate.x < -1)){
                    self.textLabel.text = "X-axis: SPIN UP/DOWN "
                } else if ((data!.rotationRate.y > 1)||(data!.rotationRate.y < -1)){
                    self.textLabel.text = "Y-axis: SPIN LEFT/RIGHT"
                    
                } else if((data!.rotationRate.z > 1)||(data!.rotationRate.z < -1)){
                    self.textLabel.text = "Z-axis: ROTATE LEFT/RIGHT"
                }
                
                else{
                    self.textLabel.text = "SPIN!"
                }
                

                self.valueXLabel.text = String(format: "%.3f", (data?.rotationRate.x)!)
                self.valueYLabel.text = String(format: "%.3f", (data?.rotationRate.y)!)
                self.valueZLabel.text = String(format: "%.3f", (data?.rotationRate.z)!)
                
            }
        }
    }
    
    
    @IBAction func stopAction(_ sender: UIButton) {
        motionManager.stopGyroUpdates()
    }
    
}

