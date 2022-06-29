//
//  NetworkManager.swift
//  Hackie News
//
//  Created by Kittisak Panluea on 29/6/2565 BE.
//

import Foundation


// ObservableObject มันจะอนุญาติให้ตัว class นี้สามารถแบบว่า boardcast อะไรก็ได้ที่ต้องการออกไป

class NetworkManager :ObservableObject {
        
//    ประกาศให้ชาวบ้านเค้ามาใช้ post ได้ตามใจชอบ
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let err = error {
                    self.handle(.failure(err))
                    return
                }
                self.handle(.success(data!))
            }
            task.resume()
        }
    }
    
    func handle (_ result:Result<Data,Error>) {
        switch result {
        case let .success(data):
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.posts = result.hits
                }
            } catch let error {
                print("Fetch Data error \(error)")
            }
        case let .failure(error):
            print(error)
        }
    }
    
}
