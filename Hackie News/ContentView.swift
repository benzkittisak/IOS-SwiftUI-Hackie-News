//
//  ContentView.swift
//  Hackie News
//
//  Created by Kittisak Panluea on 29/6/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
//            ลูปข้อมูลจาก struct post ออกมาทีละอันจาก posts มาเก็บไว้ในตัวแปร post แล้วก็เอาออกไปแสดงผลผ่าน Text
            List(networkManager.posts) { post in
                Text(post.title)
            }
            .navigationTitle("Hackie News")
        }
//        เมื่อมันโหลดหน้าเสร็จก็ให้มันไปเรียกใช้ fetchData มาก่อน
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Hello World"),
//    Post(id: "3", title: "Good bye world"),
//]


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
