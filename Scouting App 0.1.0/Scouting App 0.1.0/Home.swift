//
//  ContentView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/6/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("Home Page")
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -20)
                
                VStack{

                    HelloBar()
                    
                    Spacer()
                        .frame(height:150)
                    
                    IamText()
                    
                    Spacer()
                        .frame(height:80)
                    
                    NavigationLink(destination: AdminPageOne(team: teams[0])) {
                        AdminButton()
                    }

                    Spacer()
                            .frame(height:100)
                    
                    NavigationLink(destination: FieldPageOne()) {
                        FieldButton()
                    }
                }
            }
        }
    }
}



struct HelloBar: View {
    var body: some View {
        Text("Hello, Scout!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.01, green: 0.543, blue: 0.66))
            .offset(y: -135)
    }
}

struct IamText: View {
    var body: some View {
        Text("I am...")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.yellow)
    }
}







struct AdminButton: View {
    var body: some View {
        Text("Admin")
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.purple)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
                    )
    }
}

struct FieldButton: View {
    var body: some View {
        Text("Field")
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.green)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.green, lineWidth: 5)
                    )
                .padding(.bottom, 100)
                .padding(.top, -100)
                .offset(y: 100)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
