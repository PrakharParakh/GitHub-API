//
//  FollowersViewController.swift
//  GitHub API
//
//  Created by Prakhar Parakh on 17/10/23.
//

import UIKit

class FollowersViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var followerCollectionView: UICollectionView!
    
    var model = GitModel()
    var userName: String = ""
    
    var followers =  Followers()
    override func viewDidLoad() {
        super.viewDidLoad()

        followerCollectionView.dataSource = self
        followerCollectionView.delegate = self
        self.userNameLabel.text = userName
        
        model.delegate = self
        model.getFollowers(userName)
        
    }
 
}

extension FollowersViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        followers.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = followerCollectionView.dequeueReusableCell(withReuseIdentifier: "followerCell", for: indexPath) as! FollowerCollectionViewCell
        
        cell.set(followers,index: indexPath.row)
        
        return cell
    }
    
    
}

extension FollowersViewController: GitModelProtocol{
    
    func fetchFollowers(_ followes: Followers) {
        self.followers = followes
        followerCollectionView.reloadData()
    }
}
