//
//  DetailView.swift
//  Hackie News
//
//  Created by Kittisak Panluea on 29/6/2565 BE.
//

import SwiftUI

struct DetailView: View {
    
    let url:String?
    
    var body: some View {
        Text(url!)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.co.th")
    }
}
