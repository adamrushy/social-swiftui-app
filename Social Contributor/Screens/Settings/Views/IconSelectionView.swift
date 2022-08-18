//
//  IconSelectionView.swift
//  Social Contributor
//
//  Created by Prabaljit Walia on 18/08/22.
//

import SwiftUI

struct IconSelectionView: View {
    @EnvironmentObject var iconSettings:IconNames
    var body: some View {
        NavigationView {
            Form{
                Picker(selection: $iconSettings.currentIndex,label:Text("Icons")){
                    ForEach(0 ..< iconSettings.iconNames.count){i in
                        HStack(spacing:20){
                            Image(uiImage: UIImage(named: self.iconSettings.iconNames[i] ?? "AppIcon") ?? UIImage())
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 50, height: 50, alignment: .trailing)
                            Text(self.iconSettings.iconNames[i] ?? "AppIcon")
                        }
                    }.onReceive([self.iconSettings.currentIndex].publisher.first()){ value in
                        let i = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                        if value != i{
                            UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value], completionHandler: {
                                error in
                                if let error = error {
                                    print(error.localizedDescription)
                                } else {
                                    print("Success!")
                                }
                            })
                        }
                    }
                }
            }
            .navigationBarTitle("Change App Icon",displayMode: .inline)
        }
    }
}

struct IconSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        IconSelectionView()
    }
}
