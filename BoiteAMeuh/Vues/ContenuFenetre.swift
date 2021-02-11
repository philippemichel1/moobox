//
//  ContenuFenetre.swift
//  BoiteAMeuh
//
//  Created by Philippe MICHEL on 13/12/2020.
//

import SwiftUI

struct ContenuFenetre: View {
    //var monTexte:String
    var couleurTexte:Color
    var largeurTexte:CGFloat
    var hauteurTexte:CGFloat
    var body: some View {
        Text("instruction")
            .foregroundColor(couleurTexte)
            .multilineTextAlignment(.leading)
            .frame(width: largeurTexte, height: hauteurTexte)
    }
}

struct ContenuFenetre_Previews: PreviewProvider {
    static var previews: some View {
        ContenuFenetre (couleurTexte: .black, largeurTexte: 100, hauteurTexte: 100)
    }
}
