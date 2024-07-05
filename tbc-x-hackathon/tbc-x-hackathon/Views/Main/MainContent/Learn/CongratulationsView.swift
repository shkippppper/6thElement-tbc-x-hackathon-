//
//  CongratulationsView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import SwiftUI

struct CongratulationsView: View {
    var gotAllCorrect: Bool
    var onDismiss: (_ gotAllCorrect: Bool) -> Void
    
    var body: some View {
        VStack {
            Text(gotAllCorrect ? "გილოცავ!" : "კიდევ სცადე")
                .font(.custom("VarelaRound-Regular", size: 26))
                .padding()
            Text(gotAllCorrect ? "შენ წარმატებით დაასრულე ჩაპტერი:" : "ამ ჩაპტერში ქოინების მისაღებად ყველა სწორი პასუხი გჭირდება")
                .font(.custom("VarelaRound-Regular", size: 26))
                .padding()

            
            if gotAllCorrect {
                HStack {
                    Image("coinIcon")
                    Text("1")
                        .font(.custom("VarelaRound-Regular", size: 26))
                }
            }
            
            Button(action: {
                onDismiss(gotAllCorrect)
            }) {
                Text("OK")
                    .font(.custom("VarelaRound-Regular", size: 18))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
        }
    }
}
