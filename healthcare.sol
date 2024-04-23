// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract healtcare
{   

 struct Patient
 {
    string patient_name;
    string doctor_name;
    int patient_age;
    string disease_name;
    string prescription;
 }

 struct Doctor
 {
    string doctor_name;
    string speicalist;
    string patient_visited_1;
    string patient_visited_2;
    string patient_visited_3;
    string patient_visited_4;
 }
 
    
    address public hospital;


    constructor ()
    {
        hospital = msg.sender;
    } 


    mapping(address => Patient) public Patientdata;
    mapping(address => Doctor) public Doctordata;

    
    function Register_patient_here(address _id, string memory _patientname, string memory _doctorname, int _age, string memory _diseasename, string memory _prescription) public
    {
        require(msg.sender == hospital);
        Patientdata[_id] = Patient(_patientname, _doctorname, _age, _diseasename, _prescription);
    }

    
    function Register_doctor_here(address _add, string memory _doctorname, string memory _speicalist, string memory _patient1, string memory _patient2, string memory _patient3, string memory _patient4) public
    {
        require(msg.sender == hospital);
        Doctordata[_add] = Doctor(_doctorname, _speicalist, _patient1, _patient2, _patient3, _patient4);
    }

}