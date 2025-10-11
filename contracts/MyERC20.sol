// SPDX-License-Identifier: MIT
pragma ^0.8.0 ;

contract MyERC20 {
    //代币名称
    string public name;
    //代币符号
    string public symbol;
    //小数位数
    uint256 public decimals = 18;
    //总供应量
    uint256 public totalSupply;

    //存储账户余额
    mapping (address => uint256) public balanceOf;

    //存储授权信息
    mapping (address => mapping (address => uint256)) public allowoner;

    //合约所有者
    address public owner;

    //转账事件
    event Transfor(address indexed from, address indexed to, uint256 value);

    //授权事件
    event Approval(address indexed owner,address indexed spender, uint256 value);

    //权限控制修饰符
    modifier onlyOwner {
        require(msg.sender == owner,"Only Owner can call this function!");
        _;
        
    }

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;

        //初始发行量，考虑小数位
        uint256 initialSupplyWithdecimals = _initialSupply * (10 **uint256(decimals));
        totalSupply = initialSupplyWithdecimals;
        balanceOf[msg.sender] = totalSupply;

        emit Transfor(address(0), msg.sender, totalSupply);
    }

    //转账
    function transfer(address to , uint256 value) public returns (bool) {
        require(to != address(0),"Can not Transfer to 0 address");
        require(balanceOf[msg.sender] >= value,"Insufficient balance");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    } 


    //授权
    function approve(address spender, uint256) public returns (bool) {
        require(spender != address(0),"Can not approve to 0 address");

        allowoner[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);

        return true;

    }

    //授权转账
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require(from != address(0),"Can not from a 0 address");
        require(to != address(0),"Can not to a 0 address");
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowoner[from][msg.sender] >= value, "allowoner exceeded");

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowoner[from][msg.sender] -= value;

        emit Transfer(from ,to ,value);
        return true;

    }


    //增发代币
    function mint(address to, uint256 amount) public onlyOwner{
        require(to != address(0),"Can not mint a 0 address")
        require(amount >0,"Mint amount must be greater than 0");

        uint256 amountWithDecimals = amount * (10 ** uint256(decimals));
        totalSupply += amountWithDecimals;
        balanceof[to] += amountWithDecimals;

        emit Transfer(address(0), to , amountWithDecimals);

    }
}