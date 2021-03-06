pragma solidity >=0.4.21 <0.6.0;

contract MyToken {

    string public name = 'My Token';
    string public symbol = 'MYT';
    string public standard = 'My Token v1.0.0';
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _sender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(uint256 _initalSupply) public {
        balanceOf[msg.sender] = _initalSupply;
        totalSupply = _initalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, 'error message must contain revert');

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from], 'cannot transfer value larger than approved amount');
        require(_value <= allowance[_from][msg.sender], '');

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] = _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

}