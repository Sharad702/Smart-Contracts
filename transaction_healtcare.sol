// SPDX-License-Identifier: GPL-3.0
pragma solidity ^ 0.8.0;

contract healtcare
{
struct Patientdetails
{
     string patient_name;
     string doctor_name;
     int age;
     string disease_name;
     string prescription;
}

struct Doctordetails
{
    string doctor_name;
    uint age;
    string patient1;
    string patient2;
    string patient3;
}
struct Doctorforfees
{
    string doctor_name;
    address doctor_id;
    uint feespaid;
}
    
    address public hospital;

    constructor ()
    {
        hospital = msg.sender;
    } 

    mapping(address => Patientdetails) public Patientdata;
    mapping(address => Doctordetails) public Doctordata;
    mapping(address => uint) public balances;
    mapping(address => Doctorforfees) public feesdetails;
    
    function PatientRegistration(address _id, string memory _patientname, string memory _doctorname, int _age, string memory _diseasename, string memory _prescription) public
    {
        require(msg.sender == hospital);
        Patientdata[_id] = Patientdetails(_patientname, _doctorname, _age, _diseasename, _prescription);
    }
    
    function DoctorRegistration(address _id1, string memory _doctorname, uint _age, string memory _patient1, string memory _patient2, string memory _patient3 ) public
    {
         require(msg.sender == hospital);
         Doctordata[_id1] = Doctordetails(_doctorname, _age, _patient1, _patient2, _patient3);

    }
    function deposit(string memory _doctorname, address _doctorid, uint _feespaid ) payable external{
        balances[msg.sender] += msg.value;
        feesdetails[msg.sender]= Doctorforfees(_doctorname,_doctorid,_feespaid);
    }

    function getBalance() public view returns(uint){
        require(msg.sender == hospital);
        return address(this).balance;
    }
}