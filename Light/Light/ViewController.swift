//
//  ViewController.swift
//  Light
//
//  Created by Ed Smilovici on 2018-08-02.
//  Copyright © 2018 Ed Smilovici. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // After removing the text change code we realized there was no longer a need for this outlet
    // So first you sever the connection in the ConnectionInspector and then delete the following
    // line
    //@IBOutlet weak var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    var lightOn = true
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }
    
    func updateUI(){
//        if lightOn {
//            view.backgroundColor = .white
//            // The following line set the button text to "ON" when on
//            // This is removed in the later part of the project as it is a bit redundant
//            //lightButton.setTitle("ON", for: .normal)
//        } else {
//            view.backgroundColor = .black
//            // The following line set the button text to "OFF" when off
//            // This is removed in the later part of the project as it is a bit redundant
//            //lightButton.setTitle("OFF", for: .normal)
//        }
        // this can be translated to for some code golf (jking it's much prettier than the above
        // huge blocks):
        view.backgroundColor = lightOn ? .white : .black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

