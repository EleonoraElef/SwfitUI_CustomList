//
//  PatientItem.swift
//  SwiftUINursee
//
//  Created by eleonora elefante on 24/03/2020.
//  Copyright © 2020 eleonora elefante. All rights reserved.
//

import SwiftUI

struct PatientItem: View {
    
    var patient: Patient
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .topLeading) {
             ZStack {
             Rectangle()
             .frame(width: 380, height: 130)
             .foregroundColor(.white)
             .aspectRatio(contentMode: .fill)
             .cornerRadius(10)
             .shadow(radius: 10)
                VStack(alignment: .leading) {
                    Text("Name: \(patient.name)." + "" + "\(patient.surname)")
                    .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                        .padding(.trailing, 254.0)
                        .padding(.top, 5.0)
                    Text("Surgery date: \(patient.surgeryDateString)")
                    .padding(.top, 9.0)
                  }
                }
            Rectangle()
            .foregroundColor(.nurseeColor)
            .frame(width: 380, height: 40)
            .cornerRadius(8)
                
            Text(" Room: \(patient.room) Bed: \(patient.bed)")
            .foregroundColor(.white)
            .font(.headline)
            .padding(.vertical, 7.0)
            
            }
        }
    }
}

extension Color {
    static let nurseeColor = Color("NurseeColor")
}

struct PatientItem_Previews: PreviewProvider {
    static var previews: some View {
        PatientItem(patient: patients[0])
    }
}
