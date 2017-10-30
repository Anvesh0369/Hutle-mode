//
//  ViewController.swift
//  Hutle-mode
//
//  Created by Anvesh on 9/24/17.
//  Copyright © 2017 Anvesh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkblue: UIImageView!
    @IBOutlet weak var cloudholder: UIView!
    @IBOutlet weak var powerbtn: UIButton!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hutlemode: UILabel!
    @IBOutlet weak var onlbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError{
            print(error.description)
        }
        
    }
    
    @IBAction func powerbtnpressed(_ sender: Any) {
        cloudholder.isHidden = false
        powerbtn.isHidden = true
        darkblue.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 1.2, animations: {
            self.rocket.frame = CGRect(x: 0, y: 100, width: 375, height: 536)
        }) { (finished) in
            self.hutlemode.isHidden = false
            self.onlbl.isHidden = false
            
        }
        
    }
}

