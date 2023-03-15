//
//  ScoreViewController.swift
//  TheQuizApp
//
//  Created by Wynelher Tagayuna on 3/12/23.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var finalScore: String?
    
    @IBOutlet weak var scoreTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scoreTotalLabel.text = finalScore!+"/16"
    }

    @IBAction func retryButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
