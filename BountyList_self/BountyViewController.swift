//
//  BountyViewController.swift
//  BountyList_self
//
//  Created by YOONJONG on 2021/02/23.
//

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    // 테이블뷰(콜렉션뷰) 셀 몇 개?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    // 어떻게 보여줄까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing:CGFloat = 10
        let textAreaHeight:CGFloat = 65
        let width:CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height:CGFloat = width*10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class GridCell:UICollectionViewCell {
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
    
    var sortedList:[BountyInfo]{
        let sortedList = bountyInfoList.sorted{ prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBountyInfoList:Int {
        return bountyInfoList.count
    }
    func bountyInfo(at index:Int) -> BountyInfo{
        return sortedList[index]
    }
}
