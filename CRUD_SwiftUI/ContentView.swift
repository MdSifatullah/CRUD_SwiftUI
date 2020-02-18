//
//  ContentView.swift
//  CRUD_SwiftUI
//
//  Created by Md Sifat on 2/17/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @State private var inputName = ""
    @State private var inputEmail = ""
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [Color("1"), Color("2")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Personal Information").font(.system(size: 22)).foregroundColor(Color("Color"))
                HStack{
                    
                    Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                    TextField("Enter Your Name",  text: $inputName).padding(.leading, 12).font(.system(size: 20))
                }.padding(12)
                    .background(Color("Color"))
                    .cornerRadius(25)
                
                HStack{
                    Image(systemName: "envelope").resizable().frame(width: 20, height: 20)
                    TextField("Enter Your Email",  text: $inputEmail).padding(.leading, 12).font(.system(size: 20))
                }.padding(12)
                    .background(Color("Color"))
                    .cornerRadius(25)
                HStack{
                    Button(action: {
                        let config = Realm.Configuration(schemaVersion: 1)
                        do{
                            let realm = try Realm(configuration: config)
                            let data = DataSet()
                            data.name = self.inputName
                            data.email = self.inputEmail
                            try realm.write({
                                realm.add(data)
                                print("Success")
                            })
                        }
                        catch{
                            print (error)
                        }
                        
                    })
                    {
                        Text("Save").foregroundColor(.white).padding()
                    }.frame(width: 130)
                        .background(LinearGradient(gradient: .init(colors: [Color("2"), Color("1")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(25)
                    Button(action: {
                        let config = Realm.Configuration(schemaVersion: 1)
                            do{
                                let realm = try Realm(configuration: config)
                                let result = realm.objects(DataSet.self)
                                print(result)
                            }
                            catch{
                                print (error)
                            }
                        
                    })
                    {
                        Text("Display Data").foregroundColor(.white).padding()
                    }.frame(width: 130)
                        .background(LinearGradient(gradient: .init(colors: [Color("2"), Color("1")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(25)
                }
                
            }.padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class DataSet : Object {
    @objc dynamic var name = ""
    @objc dynamic var email = ""
}

