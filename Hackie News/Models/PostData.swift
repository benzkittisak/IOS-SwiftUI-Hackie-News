//
//  PostData.swift
//  Hackie News
//
//  Created by Kittisak Panluea on 29/6/2565 BE.
//

import Foundation

struct Results:Codable {
    let hits:[Post]
}

// เราใช้ indentifiable เพื่อให้มันรู้ว่ามันควรจะเรียงลำดับยังไง ในกรณีนี้น่ะนะ

struct Post:Codable , Identifiable {
    var id:String {
        return objectID
    }
    let objectID:String
    let points:Int
    let title:String
    let url:String
}
