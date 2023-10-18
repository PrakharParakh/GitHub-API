//
//  GitModel.swift
//  GitHub API
//
//  Created by Prakhar Parakh on 17/10/23.
//

import Foundation

protocol GitModelProtocol{
    func fetchFollowers(_ followes: Followers)
}

struct GitModel {
    
    var delegate : GitModelProtocol?
    
    func getFollowers(_ userName: String){
        
        guard let url = URL(string: "https://api.github.com/users/\(userName)/followers") else{
            print("invalid url")
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
                
                let result = try JSONDecoder().decode(Followers.self, from: data!)
                print(result)
                DispatchQueue.main.async {
                    self.delegate?.fetchFollowers(result)
                }
                print(result.count)
            
                
            }catch{
                print("decoding err")
                return
            }
            
        }
        dataTask.resume()
    }
    
}
