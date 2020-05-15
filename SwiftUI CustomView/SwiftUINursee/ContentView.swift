//
//  ContentView.swift
//  SwiftUINursee
//
//  Created by eleonora elefante on 24/03/2020.
//  Copyright © 2020 eleonora elefante. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var patientsArray: [Patient] = patients
    var patientRooms: [String] = patients.map{$0.room}
    @State private var searchText : String = ""
    @State private var states = ["All", "Unchecked"]
    @State private var selectorIndex = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "NurseeColor")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "NurseeColor")], for: .normal)
        
        
    }
    
    var body: some View {
            NavigationView {
            ScrollView(showsIndicators: false) {
                
                SearchBar(text: $searchText)
                .padding(0.0)
                .frame(width: 420.0)
                
                Picker("states", selection: $selectorIndex) {
                        ForEach(0..<states.count) { index in
                            Text(self.states[index]).tag(index)
                        }
                    }.padding(.top, -7.0).pickerStyle(SegmentedPickerStyle())
                        .padding([.leading, .trailing], 10.0)
            
                VStack(alignment: .leading){
                    ForEach(self.patientsArray, id: \.id) { patient in
                        PatientItem(patient: patient)
                            .padding(.bottom, 5.0)
                    }
                }
            }.navigationBarTitle("Patients")
            .navigationBarItems(leading:
                    HStack {
                    Button(action: {
                        print("sort button pressed")
                    }) {
                    Image("Filter").imageScale(.large)
                        }.foregroundColor(.gray)
                        }, trailing:
                    HStack {
                        NavigationLink(destination: InsertPatientData()) {
                   
                    Image(systemName: "plus.circle.fill").imageScale(.large)
                }.foregroundColor(Color.nurseeColor)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
    }
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search for rooms"
        return searchBar
    }
   
    func updateUIView(_ uiView: SearchBar.UIViewType, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}



