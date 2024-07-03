//
//  ResultViewController.swift
//  SplitPay App (Multipage)
//
//  Created by 윤진영 on 7/3/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        commentLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
