pragma solidity ^0.4.23;

contract Certifier {
    uint8 max_st = 8;

    function addCourse(
        string _name,
        bytes32 _code,
        uint8 _max_st,
        uint _start,
        uint _end,
        uint8 _hours,
        uint8 _threshold,
        bytes32[] _session_codes,
        uint8 _cost) public view returns(uint8 mxst) {
        mxst = max_st;
    }
}