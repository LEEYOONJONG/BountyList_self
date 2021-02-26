//
//  BountyViewController.swift
//  BountyList_self
//
//  Created by YOONJONG on 2021/02/23.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel = BountyViewModel()
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //detailViewController에 연결시키자
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model:bountyInfo)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
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
    
    func update(info:BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
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

class BountyViewModel{
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
    
    var numOfBountyInfoList:Int {
        return bountyInfoList.count
    }
    func bountyInfo(at index:Int) -> BountyInfo{
        return bountyInfoList[index]
    }
}
