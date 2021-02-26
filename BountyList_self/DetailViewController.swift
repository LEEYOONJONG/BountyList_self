//
//  DetailViewController.swift
//  BountyList_self
//
//  Created by YOONJONG on 2021/02/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
   
    var bountyInfo:BountyInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func UpdateUI(){
        if let bountyInfo = self.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
}
