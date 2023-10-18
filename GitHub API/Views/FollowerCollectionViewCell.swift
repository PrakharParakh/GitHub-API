//
//  FollowerCollectionViewCell.swift
//  GitHub API
//
//  Created by Prakhar Parakh on 17/10/23.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var followerLogo: UIImageView!
    
    @IBOutlet weak var followerName: UILabel!
    
    func set(_ follower: Followers,index: Int){
        self.followerName.text = follower[index].login
        
        if Cache.images[follower[index].login] != nil{
            self.followerLogo.image = UIImage(data: Cache.images[follower[index].login]!)
            self.followerLogo.layer.cornerRadius = 20
            print("Cache Hit")
        }
        else{
            guard let url = URL(string: follower[index].avatarURL) else{
                print("Invalid url")
                return
            }
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                if error != nil || data == nil{
                    print(error?.localizedDescription)
                    return
                }
                do{
                    DispatchQueue.main.async {
                        self.followerLogo.image = UIImage(data: data!)
                        self.followerLogo.layer.cornerRadius = 20

                    }
                    Cache.images[follower[index].login] = data
                    print("Cache Miss")
                }catch{
                    return
                }
            }
            dataTask.resume()
        }
        
    }
    
    
}
