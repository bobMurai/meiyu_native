//
//  TalkFromFriend.swift
//  meiyu_native
//
//  Created by 村井翔 on 2020/12/14.
//

import SwiftUI


struct TalkFromFriend: View {
    let message: String
    let datetime: Date
    let verbose_time: String
    var photo_url: String
    
    init(message: String, datetime: String, photo_url: String){
        self.message = message
        self.datetime = Util.dateFromString(string: datetime, format: "yyyy/MM/dd HH:mm:ss Z")
        self.verbose_time = Util.stringFromDate(date: self.datetime, format: "HH:mm")
        self.photo_url = photo_url
    }
        
    var body: some View {
        HStack(alignment: .bottom) {
            Image(self.photo_url)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text(self.message)
                .padding(3)
                .background(Color.tBackground)
                .cornerRadius(5)
            Text(self.verbose_time)
                .font(.footnote)
            Spacer()
        }
    }
}

struct TalkFromFriend_Previews: PreviewProvider {
    static var previews: some View {
        TalkFromFriend(message: "konodesu", datetime: "2015/03/04 12:34:56 +09:00", photo_url: "profile")
    }
}
