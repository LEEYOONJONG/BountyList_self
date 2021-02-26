//
//  BountyViewController.swift
//  BountyList_self
//
//  Created by YOONJONG on 2021/02/23.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let bountyInfoList:[BountyInfo] = [
        BountyInfo(name:"brook", bounty:33000000),
        BountyInfo(name:"chopper", bounty:50),
        BountyInfo(name:"franky", bounty:44000000),
        BountyInfo(name:"luffy", bounty:30000000),
        BountyInfo(name:"nami", bounty:16000000),
        BountyInfo(name:"robin", bounty:8000000),
        BountyInfo(name:"sanji", bounty:7700000),
        BountyInfo(name:"zoro", bounty:120000000),
        
    ]
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //detailViewController에 연결시키자
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = bountyInfoList[index]
                vc?.bountyInfo = bountyInfo
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        let bountyInfo = bountyInfoList[indexPath.row]
        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // 클릭한다면
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        print(indexPath.row)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   



}

class ListCell:UITableViewCell {
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var bountyLabel:UILabel!
}


struct BountyInfo {
    let name:String
    let bounty:Int
    var image:UIImage?{
        return UIImage(named:"\(name).jpg")
    }
    init(name:String, bounty:Int){
        self.name = name
        self.bounty = bounty
    }
}

