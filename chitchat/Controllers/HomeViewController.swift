//
//  HomeViewController.swift
//  chitchat
//
//  Created by Liza Bipin on 14/08/21.
//

import UIKit
import TweenKit


class HomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    let scheduler = ActionScheduler()    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "chatchit"
            }
    

    override func viewDidAppear(_ animated: Bool) {
        
            super.viewDidAppear(animated)
            
        
        let action = InterpolationAction(from: "chatchit", to: "chitchat", duration: 0.7, easing: .exponentialInOut) { [unowned self] in
                self.titleLabel.text = $0
            }
            
           
            let sequence = ActionSequence(actions: DelayAction(duration: 0.5), action, DelayAction(duration: 0.5))
            
        
            scheduler.run(action: action)
        }
        
   

}
