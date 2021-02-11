//
//  BoutonFermeture.swift
//  BoiteAMeuh
//
//  Created by Philippe MICHEL on 13/12/2020.
//

import SwiftUI

struct BoutonFermeture: View {
    @Binding var fermetureFenetre:Bool
    var couleurFond:Color
    var couleurTexte : Color
    var body: some View {
        Button(action: {
            self.fermetureFenetre.toggle()
        }, label: {
            Text("close")
                .padding()
                .background(couleurFond)
                .foregroundColor(couleurTexte)
                .cornerRadius(10)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: 2, y: 2)
        })
    }
}

struct BoutonFermeture_Previews: PreviewProvider {
    static var previews: some View {
        BoutonFermeture(fermetureFenetre: .constant(false), couleurFond: .white, couleurTexte: .black)
    }
}
