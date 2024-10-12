//
//  ScoreViewController.swift
//  TestDelegateApp2
//
//  Created by Кирилл Сысоев on 12.10.24.
//

import UIKit

class ScoreViewController: UIViewController {

    var score: Int = 0
    
    weak var delegate: ViewControllerDelegate?
    
    var bool = true
    
    func updateScore() {
        scoreLabel.text = "\(score)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScore()
        
        UserDefaults.standard.set(bool, forKey: "wasOpened")
        
        
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func makeNull(_ sender: UIButton) {
        score = 0
        if let delegate = delegate {
            delegate.updateScore(score, "summaVC")
        }
        updateScore()
    }
    
}
