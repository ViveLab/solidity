pragma solidity ^0.4.23;

contract Certifier {
    struct Course {
        string name;
        uint8 max_students;
        uint start;
        uint end;
        uint8 duration;
        uint8 threshold;
        bytes32[] session_codes;
        uint8 cost;
        mapping(address => Student) students;
    }

    struct Student {
        string id;
        string fname;
        string lname;
        string email;
        bytes32[] session_codes;
        bool isCertified;
    }

    address public certifierAccount;
    mapping(bytes32 => Course) courses;

    constructor () public {
        certifierAccount = msg.sender;
    }

    modifier onlyCertifier () {
        require(msg.sender == certifierAccount);
        _;
    }

    function addCourse(
        string _name,
        bytes32 _code,
        uint8 _max_st,
        uint _start,
        uint _end,
        uint8 _hours,
        uint8 _threshold,
        bytes32[] _session_codes,
        uint8 _cost) public onlyCertifier {
        courses[_code] = Course({
            name : _name,
            max_students : _max_st,
            start : _start,
            end : _end,
            duration : _hours,
            threshold : _threshold,
            session_codes : _session_codes,
            cost : _cost
            });
    }

    function subscribe(
        bytes32 _code,
        string _fname,
        string _lname,
        string _id,
        uint8 _discount,
        string _email
    ) public payable {
        Course storage course = courses[_code];
        require(msg.value == 3 ether, "You didn't send 3 ether");
        course.students[msg.sender] = Student({
            id: _id,
            fname : _fname,
            lname : _lname,
            email : _email,
            session_codes : new bytes32[](0),
            isCertified : false
            });
    }
}