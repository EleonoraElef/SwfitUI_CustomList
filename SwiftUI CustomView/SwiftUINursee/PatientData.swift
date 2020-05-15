//
//  PatientData.swift
//  SwiftUINursee
//
//  Created by eleonora elefante on 24/03/2020.
//  Copyright © 2020 eleonora elefante. All rights reserved.
//
import Foundation
import SwiftUI

struct Patient: Identifiable, Hashable {
    var id: Int
    var name, surname, surgeryDateString, room, bed: String
    var checked: Bool
    var exams: [Exam]
    
}

struct Exam: Identifiable, Hashable {
    var id: Int
    var name: String
    var performed: Bool
    
}

var exam1 = Exam(id: 0, name: "Exam1", performed: true)
var exam2 = Exam(id: 1, name: "Exam2", performed: true)
var exam3 = Exam(id: 2, name: "Exam3", performed: false)
var exam4 = Exam(id: 3, name: "Exam4", performed: false)
var exam5 = Exam(id: 4, name: "Exam5", performed: true)


var patient1 = Patient(id: 0, name: "E", surname: "State", surgeryDateString: "12/04/20", room: "14", bed: "C", checked: true, exams: [exam1, exam2, exam3, exam4, exam5])
var patient2 = Patient(id: 1, name: "W", surname: "Ater", surgeryDateString: "15/04/20", room: "21", bed: "A", checked: true, exams: [exam1, exam2, exam3, exam4, exam5])
var patient3 = Patient(id: 2, name: "R", surname: "Idere", surgeryDateString: "17/04/20", room: "20", bed: "B", checked: true, exams: [exam1, exam2, exam3, exam4, exam5])
var patient4 = Patient(id: 3, name: "E", surname: "Lle", surgeryDateString: "2/05/20", room: "18", bed: "A", checked: true, exams: [exam1, exam2, exam3, exam4, exam5])
var patient5 = Patient(id: 4, name: "G", surname: "Irare", surgeryDateString: "7/05/20", room: "16", bed: "A", checked: true, exams: [exam1, exam2, exam3, exam4, exam5])

var patients : [Patient] = [patient1, patient2, patient3, patient4, patient5]
