pragma solidity ^0.4.23;

contract Certifier {
    struct Course {
        string name;
        uint8 students;
        uint start;
        uint end;
        uint8 duration;
        uint8 threshold;
        bytes32[] session_codes;
        uint8 cost;
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
            students : _max_st,
            start : _start,
            end : _end,
            duration : _hours,
            threshold : _threshold,
            session_codes : _session_codes,
            cost : _cost
            });
    }
}