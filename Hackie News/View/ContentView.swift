//
//  ContentView.swift
//  Hackie News
//
//  Created by Kittisak Panluea on 29/6/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var isLoading = false
    @State var text:String = ""
    
    var body: some View {
        NavigationView {
            
            //            ลูปข้อมูลจาก struct post ออกมาทีละอันจาก posts มาเก็บไว้ในตัวแปร post แล้วก็เอาออกไปแสดงผลผ่าน Text
            List(networkManager.posts) { post in
                
                NavigationLink(destination: DetailView(url: post.url)) {
                    
                    HStack{
                        Text(String(post.points))
                        Text(post.title).lineLimit(1)
                    }
                }
            }
            .navigationTitle("Hackie News")
            .searchable(text: $text)
        }
        //        เมื่อมันโหลดหน้าเสร็จก็ให้มันไปเรียกใช้ fetchData มาก่อน
        .onAppear {
            self.networkManager.fetchData()
        }
        .onSubmit(of: .search, {
            print(text)
            self.networkManager.fetchData(search:text)
        })
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
