//
//  TalkFromSelf.swift
//  meiyu_native
//
//  Created by 村井翔 on 2020/12/14.
//

import SwiftUI

struct TalkFromSelf: View {
    let message: String
    let datetime: Date
    let verbose_time: String
    
    init(message: String, datetime: String){
        self.message = message
        self.datetime = Util.dateFromString(string: datetime, format: "yyyy/MM/dd HH:mm:ss Z")
        self.verbose_time = Util.stringFromDate(date: self.datetime, format: "HH:mm")
    }
        
    var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            Text(self.message)
                .padding(3)
                .background(Color.t2ndBackground)
                .cornerRadius(5)
            Text(self.verbose_time)
                .font(.footnote)
        }
    }
}

struct TalkFromSelf_Previews: PreviewProvider {
    static var previews: some View {
        TalkFromSelf(message: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", datetime: "2015/03/04 12:34:56 +09:00")
        
    }
}
