//
//  ContentView.swift
//  BoiteAMeuh
//
//  Created by Philippe MICHEL on 13/12/2020.
//

import SwiftUI
import SafariServices

struct ContentView: View {
    @State var montrerModeEmplois:Bool = false
    @State var montrerFenetreAPropos:Bool = false
    @State var executeAnimation :Bool = false
    @State var montrerSafari:Bool = false
    var urlString = "https://www.titastus.com"
    let ecran = UIScreen.main.bounds
    var body: some View {
        NavigationView {
            ZStack {
                BoiteMeuh(basculeAnim: $executeAnimation)
                    .padding()
                    //.navigationTitle("Exemple Menu")
                    .toolbar {
                        ToolbarItem(placement:.bottomBar) {
                            ZStack {
                                HStack {
                                    Button(action: {
                                        //passe la variable à vrai ou à faux
                                        self.montrerModeEmplois.toggle()
                                    }, label: {
                                        Text("buttoninstruction")
                                    })
                                    Spacer(minLength: 40)
                                    Button(action: {
                                        self.montrerFenetreAPropos.toggle()
                                    }, label: {
                                        Text("aboutus")
                                    })
                                }
                                
                            }
                        }
                    }
                //montrer la fenetre mode emplois
                if montrerModeEmplois {
                    ZStack(alignment: .center) {
                        FenetreMenu(largeurFenetre: 372, hauteurFenetre: 250)
                        VStack {
                            ContenuFenetre(couleurTexte: .black, largeurTexte: 330, hauteurTexte: 140)
                                .padding()
                            BoutonFermeture(fermetureFenetre: $montrerModeEmplois, couleurFond: .white, couleurTexte: .red)
                        }
                    }
                }
                // montrer genetre A propos
                if montrerFenetreAPropos {
                    ZStack(alignment: .center) {
                        FenetreMenu(largeurFenetre: 270, hauteurFenetre: 130)
                        VStack {
                            HStack {
                                Image(Ressources.images.titastus.rawValue)
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                Button(action: {
                                    montrerSafari.toggle()
                                }, label: {
                                    Text("www.titastus.com")
                                }) .sheet(isPresented: $montrerSafari) {
                                    ControleurSafari(url: URL(string: self.urlString)!)
                                    .padding()
                                }
                            }
                            
                            BoutonFermeture(fermetureFenetre: $montrerFenetreAPropos, couleurFond: .black, couleurTexte: .red)
                        }
                    }
                }
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .edgesIgnoringSafeArea(.all)
            .background(Color.black)
            
        }
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
