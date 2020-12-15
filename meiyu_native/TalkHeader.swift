//
//  TalkHeader.swift
//  meiyu_native
//
//  Created by 村井翔 on 2020/12/14.
//

import SwiftUI

struct TalkHeader: View {
    var nickname: String
    
    init(friend_relation_id: String){
        //ここでローカルのDBを使ってfriend_relation_idを用いて
        //トーク相手のnicknameを取得する。
        self.nickname = "むらぴょん"
    }
    
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.title)
                .foregroundColor(.white)
            Text(self.nickname)
                .font(.title2)
                .fontWeight(.heavy)
            Spacer()
        }
        .padding()
        .background(Color.tBackground)
    }
}

struct TalkHeader_Previews: PreviewProvider {
    static var previews: some View {
        TalkHeader(friend_relation_id: "id")
    }
}
