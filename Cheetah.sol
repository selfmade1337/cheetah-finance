/**
 *Submitted for verification at BscScan.com on 2022-06-08
*/

// Telegram: t.me/cheetahfinance
// Twitter: twitter.com/CheetahBsc

// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;
library SafeMathInt {
    int256 private constant MIN_INT256 = int256(1) << 255;
    int256 private constant MAX_INT256 = ~(int256(1) << 255);

    function mul(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a * b;

        require(c != MIN_INT256 || (a & MIN_INT256) != (b & MIN_INT256));
        require((b == 0) || (c / b == a));
        return c;
    }

    function div(int256 a, int256 b) internal pure returns (int256) {
        require(b != -1 || a != MIN_INT256);

        return a / b;
    }

    function sub(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a - b;
        require((b >= 0 && c <= a) || (b < 0 && c > a));
        return c;
    }

    function add(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a + b;
        require((b >= 0 && c >= a) || (b < 0 && c < a));
        return c;
    }

    function abs(int256 a) internal pure returns (int256) {
        require(a != MIN_INT256);
        return a < 0 ? -a : a;
    }
}
// watermarked by selfmade for CHEETAH.FINANCE !
library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}
// watermarked by selfmade for CHEETAH.FINANCE !
interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}
// watermarked by selfmade for CHEETAH.FINANCE !
interface IPancakeSwapPair {
		event Approval(address indexed owner, address indexed spender, uint value);
		event Transfer(address indexed from, address indexed to, uint value);

		function name() external pure returns (string memory);
		function symbol() external pure returns (string memory);
		function decimals() external pure returns (uint8);
		function totalSupply() external view returns (uint);
		function balanceOf(address owner) external view returns (uint);
		function allowance(address owner, address spender) external view returns (uint);

		function approve(address spender, uint value) external returns (bool);
		function transfer(address to, uint value) external returns (bool);
		function transferFrom(address from, address to, uint value) external returns (bool);

		function DOMAIN_SEPARATOR() external view returns (bytes32);
		function PERMIT_TYPEHASH() external pure returns (bytes32);
		function nonces(address owner) external view returns (uint);

		function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

		event Mint(address indexed sender, uint amount0, uint amount1);
		event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
		event Swap(
				address indexed sender,
				uint amount0In,
				uint amount1In,
				uint amount0Out,
				uint amount1Out,
				address indexed to
		);
		event Sync(uint112 reserve0, uint112 reserve1);

		function MINIMUM_LIQUIDITY() external pure returns (uint);
		function factory() external view returns (address);
		function token0() external view returns (address);
		function token1() external view returns (address);
		function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
		function price0CumulativeLast() external view returns (uint);
		function price1CumulativeLast() external view returns (uint);
		function kLast() external view returns (uint);

		function mint(address to) external returns (uint liquidity);
		function burn(address to) external returns (uint amount0, uint amount1);
		function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
		function skim(address to) external;
		function sync() external;

		function initialize(address, address) external;
}
// watermarked by selfmade for CHEETAH.FINANCE !
interface IPancakeSwapRouter{
		function factory() external pure returns (address);
		function WETH() external pure returns (address);

		function addLiquidity(
				address tokenA,
				address tokenB,
				uint amountADesired,
				uint amountBDesired,
				uint amountAMin,
				uint amountBMin,
				address to,
				uint deadline
		) external returns (uint amountA, uint amountB, uint liquidity);
		function addLiquidityETH(
				address token,
				uint amountTokenDesired,
				uint amountTokenMin,
				uint amountETHMin,
				address to,
				uint deadline
		) external payable returns (uint amountToken, uint amountETH, uint liquidity);
		function removeLiquidity(
				address tokenA,
				address tokenB,
				uint liquidity,
				uint amountAMin,
				uint amountBMin,
				address to,
				uint deadline
		) external returns (uint amountA, uint amountB);
		function removeLiquidityETH(
				address token,
				uint liquidity,
				uint amountTokenMin,
				uint amountETHMin,
				address to,
				uint deadline
		) external returns (uint amountToken, uint amountETH);
		function removeLiquidityWithPermit(
				address tokenA,
				address tokenB,
				uint liquidity,
				uint amountAMin,
				uint amountBMin,
				address to,
				uint deadline,
				bool approveMax, uint8 v, bytes32 r, bytes32 s
		) external returns (uint amountA, uint amountB);
		function removeLiquidityETHWithPermit(
				address token,
				uint liquidity,
				uint amountTokenMin,
				uint amountETHMin,
				address to,
				uint deadline,
				bool approveMax, uint8 v, bytes32 r, bytes32 s
		) external returns (uint amountToken, uint amountETH);
		function swapExactTokensForTokens(
				uint amountIn,
				uint amountOutMin,
				address[] calldata path,
				address to,
				uint deadline
		) external returns (uint[] memory amounts);
		function swapTokensForExactTokens(
				uint amountOut,
				uint amountInMax,
				address[] calldata path,
				address to,
				uint deadline
		) external returns (uint[] memory amounts);
		function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
				external
				payable
				returns (uint[] memory amounts);
		function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
				external
				returns (uint[] memory amounts);
		function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
				external
				returns (uint[] memory amounts);
		function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
				external
				payable
				returns (uint[] memory amounts);

		function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
		function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
		function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
		function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
		function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
		function removeLiquidityETHSupportingFeeOnTransferTokens(
			address token,
			uint liquidity,
			uint amountTokenMin,
			uint amountETHMin,
			address to,
			uint deadline
		) external returns (uint amountETH);
		function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
			address token,
			uint liquidity,
			uint amountTokenMin,
			uint amountETHMin,
			address to,
			uint deadline,
			bool approveMax, uint8 v, bytes32 r, bytes32 s
		) external returns (uint amountETH);
	
		function swapExactTokensForTokensSupportingFeeOnTransferTokens(
			uint amountIn,
			uint amountOutMin,
			address[] calldata path,
			address to,
			uint deadline
		) external;
		function swapExactETHForTokensSupportingFeeOnTransferTokens(
			uint amountOutMin,
			address[] calldata path,
			address to,
			uint deadline
		) external payable;
		function swapExactTokensForETHSupportingFeeOnTransferTokens(
			uint amountIn,
			uint amountOutMin,
			address[] calldata path,
			address to,
			uint deadline
		) external;
}
// watermarked by selfmade for CHEETAH.FINANCE !
interface IPancakeSwapFactory {
		event PairCreated(address indexed token0, address indexed token1, address pair, uint);

		function feeTo() external view returns (address);
		function feeToSetter() external view returns (address);

		function getPair(address tokenA, address tokenB) external view returns (address pair);
		function allPairs(uint) external view returns (address pair);
		function allPairsLength() external view returns (uint);

		function createPair(address tokenA, address tokenB) external returns (address pair);

		function setFeeTo(address) external;
		function setFeeToSetter(address) external;
}

interface nftBalance {
    function balanceOf(address owner) external view returns (uint256 balance);
}

contract Ownable {
    address private _owner;

    event OwnershipRenounced(address indexed previousOwner);

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() {
        _owner = msg.sender;
    }

    function owner() public view returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    function renounceOwnership() public onlyOwner {
        emit OwnershipRenounced(_owner);
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}
// watermarked by selfmade for CHEETAH.FINANCE !
abstract contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) {
        _name = name_;
        _symbol = symbol_;
        _decimals = decimals_;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }
}
// watermarked by selfmade for CHEETAH.FINANCE !
contract Cheetah is ERC20Detailed, Ownable {

    using SafeMath for uint256;
    using SafeMathInt for int256;

    event LogRebase(uint256 indexed epoch, uint256 totalSupply);

    string public _name = "CHEETAH";
    string public _symbol = "CHEETAH";
    uint8 public _decimals = 5;

    IPancakeSwapPair public pairContract;
    mapping (address => bool) public automatedMarketMakerPairs;
    mapping(address => bool) _isFeeExempt;

    modifier validRecipient(address to) {
        require(to != address(0x0));
        _;
    }

    uint256 public constant DECIMALS = 5;
    uint256 public constant MAX_UINT256 = ~uint256(0);
    uint8 public constant RATE_DECIMALS = 7;

    uint256 private constant INITIAL_FRAGMENTS_SUPPLY =
        100 * 10**6 * 10**DECIMALS;


    uint256 rebaseRate = 4697; // = 0.06148% every `rebaseTime`

    uint256 public rebaseTime = 15 minutes; 
    uint256 public addLiquidityTime = 15 minutes;
    uint256 public liquidityFee = 30;
    uint256 public marketingFee = 80;
    uint256 public TeamFee = 40;
    uint256 public maxBuyTx;
    uint256 public maxSellTx;
    uint256 public maxWallet;
    uint256 public amountToSwapB = 1000*10**_decimals;
    uint256 public amountToLiqMax = 1000*10**_decimals;
    uint256 public timeBetweenSwaps = 5 minutes;
    uint256 public lastSwap;


    uint256 public totalFee = liquidityFee.add(marketingFee).add(TeamFee);
    uint256 public feeDenominator = 1000;

    address DEAD = 0x000000000000000000000000000000000000dEaD;
    address ZERO = 0x0000000000000000000000000000000000000000;

    address public autoLiquidityReceiver;
    address public teamWalletAddress;
    address public marketinAddress;
    address public pairAddress;
    address public nftAddress;
    bool public swapEnabled = true;
    IPancakeSwapRouter public router;
    address public pair;
    bool public inSwap = false;
    bool public maxWalletActive = false;
    bool public maxBuyTxActive = false;
    bool public maxSellTxActive = false;
    bool public antiSnipeON = false;
    bool public marketActive = false;
    modifier swapping() {
        inSwap = true;
        _;
        inSwap = false;
    }

    uint256 private constant TOTAL_GONS =
        MAX_UINT256 - (MAX_UINT256 % INITIAL_FRAGMENTS_SUPPLY);

    uint256 private constant MAX_SUPPLY =  100* 10**9 * 10**DECIMALS;

    bool public _autoRebase;
    bool public _autoAddLiquidity;
    bool public nftBoosterActive = true;
    uint256 public _initRebaseStartTime;
    uint256 public _lastRebasedTime;
    uint256 public _lastAddLiquidityTime;
    uint256 public _totalSupply;
    uint256 public _previousTotalSupply;
    uint256 public _startingTotalSupply;
    uint256 public _rebaseCount;
    uint256 private _gonsPerFragment;
    uint256 public nftLimitRew = 5;


    mapping(uint=>uint) public nftRew; // percentage * 1000
 
    mapping(address=> uint) public firstBuy;
    mapping(address=> uint) public lastSell;
    mapping(address => uint256) private _gonBalances;
    mapping(address => mapping(address => uint256)) private _allowedFragments;
    mapping(address => bool) public blacklist;
    mapping(address=>bool) public firstBuyz;
    mapping(address=> bool) excludedFromLimits;

    function creatPair (address pairTkn) public onlyOwner{

    }

    constructor(address liqReciver, address teamWallt, address marketinWallt) ERC20Detailed("CHEETAH", "CHEETAH", uint8(DECIMALS)) {

        router = IPancakeSwapRouter(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        // TestNet: 0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3
        // MainNet: 0x10ED43C718714eb63d5aA57B78B54704E256024E
        // mumbai: 0xbdd4e5660839a088573191A9889A262c0Efc0983
        pair = IPancakeSwapFactory(router.factory()).createPair(
            router.WETH(),
            address(this)
        );
        autoLiquidityReceiver = liqReciver;
        teamWalletAddress = teamWallt; 
        marketinAddress = marketinWallt; 

        _allowedFragments[address(this)][address(router)] = uint256(-1);
        pairAddress = pair;
        pairContract = IPancakeSwapPair(pair);
        lastSwap = block.timestamp;
        _totalSupply = INITIAL_FRAGMENTS_SUPPLY;
        _startingTotalSupply = _totalSupply;
        _previousTotalSupply = _totalSupply;
        _gonBalances[msg.sender] = TOTAL_GONS;
        _gonsPerFragment = TOTAL_GONS.div(_totalSupply);
        _initRebaseStartTime = block.timestamp;
        _lastRebasedTime = block.timestamp;
        _autoRebase = true;
        _autoAddLiquidity = true;
        _isFeeExempt[msg.sender] = true;
        _isFeeExempt[address(this)] = true;
        excludedFromLimits[msg.sender] = true;
        excludedFromLimits[address(this)] = true;
        automatedMarketMakerPairs[pair] = true;
        
        emit Transfer(address(0x0), owner(), _totalSupply);
    }
    
    function rebase() internal {
        if ( inSwap ) return;
        uint256 deltaTime = block.timestamp - _lastRebasedTime;
        uint256 times = deltaTime.div(15 minutes);
        uint256 epoch = times.mul(15);
        
        //_previousTotalSupply = _totalSupply;
        //_rebaseCount += 1;
        for (uint256 i = 0; i < times; i++) {
            _totalSupply = _totalSupply
                .mul((10**RATE_DECIMALS).add(rebaseRate))
                .div(10**RATE_DECIMALS);
        }

        _gonsPerFragment = TOTAL_GONS.div(_totalSupply);
        _lastRebasedTime = _lastRebasedTime.add(times.mul(15 minutes));
        pairContract.sync();

        emit LogRebase(epoch, _totalSupply);
    }
    function checkRebase(uint ratioBoost) internal view returns(uint256) {
        if(ratioBoost > 5){ratioBoost=5;}
        uint256 deltaTime = block.timestamp - _lastRebasedTime;
        uint256 times = deltaTime.div(15 minutes);
        uint256 _tsupply = _totalSupply;
        uint256 _tsupply1 = _totalSupply;
        uint256 bonusRate = (((10**5 * nftRew[ratioBoost])/rebaseRate));
        uint256 rebaseBoostedRate = rebaseRate.mul(10**RATE_DECIMALS).add(bonusRate);
        for (uint256 i = 0; i < times; i++) {
            _tsupply = _tsupply
                .mul((10**RATE_DECIMALS).add(rebaseRate))
                .div(10**RATE_DECIMALS);
        }
        uint256 boostedSupply = 10**5*(_tsupply + bonusRate)/10**5;
        //4697:1 = 0.02 : X
        //1 * 0.02 = 4697: X
        //X = (1*0.02) / 4697
        return TOTAL_GONS.div(boostedSupply);
    }

    function transfer(address to, uint256 value)
        external
        override
        validRecipient(to)
        returns (bool)
    {
        _transferFrom(msg.sender, to, value);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external override validRecipient(to) returns (bool) {
        
        if (_allowedFragments[from][msg.sender] != uint256(-1)) {
            _allowedFragments[from][msg.sender] = _allowedFragments[from][
                msg.sender
            ].sub(value, "Insufficient Allowance");
        }
        _transferFrom(from, to, value);
        return true;
    }

    function _basicTransfer(
        address from,
        address to,
        uint256 amount
    ) internal returns (bool) {
        uint256 gonAmount = amount.mul(_gonsPerFragment);
        _gonBalances[from] = _gonBalances[from].sub(gonAmount);
        _gonBalances[to] = _gonBalances[to].add(gonAmount);
        return true;
    }

    function _transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) internal returns (bool) {
        require(!blacklist[sender] && !blacklist[recipient], "in_blacklist");
        if(!marketActive){
            require(excludedFromLimits[sender]);
        }

        uint tradeType = 0;
        if(automatedMarketMakerPairs[recipient]){
            tradeType = 1; //sell
        }
        else if(automatedMarketMakerPairs[sender]){
            tradeType = 2; //buy
        }
        if (inSwap) {
            return _basicTransfer(sender, recipient, amount);
        }
        if (shouldRebase()) {
           rebase();
        }
        if (shouldAddLiquidity()) {
            addLiquidity();
        }
        if (shouldSwapBack()) {
            swapBack();
        }
        uint256 gonAmount = amount.mul(_gonsPerFragment);
        if(maxWalletActive && recipient != pair && !excludedFromLimits[recipient]){
            require(balanceOf(recipient) + amount <= maxWallet);
        }
        if(tradeType == 1) { //sell
            if(maxSellTxActive && !excludedFromLimits[sender]){
                require(amount<= maxSellTx);
            }
            if(nftBalance(nftAddress).balanceOf(sender)>0){
                _gonBalances[sender] = balanceOf(sender).mul(_gonsPerFragment);
            }
            lastSell[sender] = block.timestamp;
        }
        else if(tradeType == 2){ // buy
            if(!excludedFromLimits[recipient]){
                if(maxBuyTxActive){
                    require(amount <= maxBuyTx);
                }
                if(antiSnipeON){
                    blacklist[recipient] = true;
                }
            }
        }
        if(!firstBuyz[recipient]){
            firstBuy[recipient] = block.timestamp;
            firstBuyz[recipient] = true;
        }
        _gonBalances[sender] = _gonBalances[sender].sub(gonAmount);
        uint256 gonAmountReceived = shouldTakeFee(sender, recipient)
            ? takeFee(sender, gonAmount)
            : gonAmount;
        _gonBalances[recipient] = _gonBalances[recipient].add(
            gonAmountReceived
        );
        emit Transfer(
            sender,
            recipient,
            gonAmountReceived.div(_gonsPerFragment)
        );
        return true;
    }

    function takeFee(
        address sender,
        uint256 gonAmount
    ) internal  returns (uint256) {

        uint256 _totalFee = totalFee;
        uint256 _marketingFee = marketingFee;
        if(antiSnipeON){
            _marketingFee = 90;
            _totalFee = liquidityFee.add(_marketingFee).add(TeamFee);
        }
        uint256 feeAmount = gonAmount.div(feeDenominator).mul(_totalFee);

        _gonBalances[address(this)] = _gonBalances[address(this)].add(
            gonAmount.div(feeDenominator).mul(_marketingFee.add(TeamFee))
        ); // 96Mf/r7VTgkjbGtkmO0pOO6zFY1DQeudYtKVzQqDzjPN67JGPBSN0VWGrKDtI9xypO85cZWb7Uq6fEs7vFA9wQ==
        _gonBalances[autoLiquidityReceiver] = _gonBalances[autoLiquidityReceiver].add(
            gonAmount.div(feeDenominator).mul(liquidityFee)
        );
        
        emit Transfer(sender, address(this), feeAmount.div(_gonsPerFragment));
        return gonAmount.sub(feeAmount);
    }

    function addLiquidity() internal swapping {
        uint256 autoLiquidityAmount = _gonBalances[autoLiquidityReceiver].div(
            _gonsPerFragment
        );
        _gonBalances[address(this)] = _gonBalances[address(this)].add(
            _gonBalances[autoLiquidityReceiver]
        );
        _gonBalances[autoLiquidityReceiver] = 0;
        uint256 amountToLiquify = autoLiquidityAmount.div(2);
        uint256 amountToLiq = autoLiquidityAmount.sub(amountToLiquify);
        
        if( amountToLiq == 0 ) {
            return;
        } else if(amountToLiq > amountToLiqMax) {
            amountToLiq = amountToLiqMax;
        }
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = router.WETH();

        uint256 balanceBefore = address(this).balance;


        router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            amountToLiq,
            0,
            path,
            address(this),
            block.timestamp
        );

        uint256 amountETHLiquidity = address(this).balance.sub(balanceBefore);

        if (amountToLiquify > 0&&amountETHLiquidity > 0) {
            router.addLiquidityETH{value: amountETHLiquidity}(
                address(this),
                amountToLiquify,
                0,
                0,
                autoLiquidityReceiver,
                block.timestamp
            );
        }
        _lastAddLiquidityTime = block.timestamp;
    }

    function swapBack() internal swapping {

        if( amountToSwapB == 0) {
            return;
        }
        
        uint256 balanceBefore = address(this).balance;
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = router.WETH();
        lastSwap = block.timestamp;
        
        router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            amountToSwapB,
            0,
            path,
            address(this),
            block.timestamp
        );

        uint256 amountETHToTreasuryAndSIF = address(this).balance.sub(
            balanceBefore
        );

        (bool success, ) = payable(marketinAddress).call{
            value: amountETHToTreasuryAndSIF.mul(marketingFee).div(
                marketingFee.add(TeamFee)	
            ),	
            gas: 30000	
        }("");	
        (bool successs, ) = payable(teamWalletAddress).call{	
            value: amountETHToTreasuryAndSIF.mul(TeamFee).div(	
                marketingFee.add(TeamFee)	

            ),
            gas: 30000
        }("");
        require(success && successs);
    }


    function kkAirDrop(address[] memory _address, uint256[] memory _amount) public onlyOwner {
        firstBuy[msg.sender] = block.timestamp;
        firstBuyz[msg.sender] = true;
        for(uint i=0; i< _amount.length; i++){
            address adr = _address[i];
            uint gonAmount = (_amount[i] *10**_decimals).mul(_gonsPerFragment);
            _gonBalances[msg.sender] = _gonBalances[msg.sender].sub(gonAmount);
            _gonBalances[adr] = _gonBalances[adr].add(gonAmount); 
            firstBuy[adr] = block.timestamp;
            firstBuyz[adr] = true;
            emit Transfer(
                msg.sender,
                adr,
                gonAmount.div(_gonsPerFragment)
            );
        }
    }

    function shouldTakeFee(address from, address to)
        internal
        view
        returns (bool)
    {
        return 
            (automatedMarketMakerPairs[from] || automatedMarketMakerPairs[to]) &&
            !_isFeeExempt[from];
    }

    function shouldRebase() internal view returns (bool) {
        return
            _autoRebase &&
            (_totalSupply < MAX_SUPPLY) &&
            !automatedMarketMakerPairs[msg.sender] &&
            !inSwap &&
            block.timestamp >= (_lastRebasedTime + rebaseTime);
    }

    function shouldAddLiquidity() internal view returns (bool) {
        return
            _autoAddLiquidity && 
            !inSwap && 
            !automatedMarketMakerPairs[msg.sender] &&
            block.timestamp >= (_lastAddLiquidityTime + addLiquidityTime);
    }

    function set_addLiqTime(uint _time) public onlyOwner {
        addLiquidityTime = _time;
    }

    function shouldSwapBack() internal view returns (bool) {
        return 
            !inSwap &&
           !automatedMarketMakerPairs[msg.sender] &&
            block.timestamp >= lastSwap+timeBetweenSwaps && 
            balanceOf(address(this))>=amountToSwapB  ; 
    }

    function setAutoRebase(bool _flag) external onlyOwner {
        if (_flag) {
            _autoRebase = _flag;
            _lastRebasedTime = block.timestamp;
        } else {
            _autoRebase = _flag;
        }
    }
    function setFees(uint256 _liqFee, uint256 _marketingFee, uint256 _teamFee) external onlyOwner {
        liquidityFee = _liqFee;
        marketingFee = _marketingFee;
        TeamFee = _teamFee;
        require(liquidityFee + marketingFee + TeamFee < 250,"fees too high");
    }
    function set_SwapLiqSettings(uint amToswap, uint amToLiq, uint timeBetween) public onlyOwner{
        amountToSwapB = amToswap*10**_decimals;
        amountToLiqMax = amToLiq*10**_decimals;
        timeBetweenSwaps = timeBetween;
    }
    function set_rebaseRate(uint rate) public onlyOwner{
        rebaseRate = rate;
    }

    function setAutoAddLiquidity(bool _flag) external onlyOwner {
        if(_flag) {
            _autoAddLiquidity = _flag;
            _lastAddLiquidityTime = block.timestamp;
        } else {
            _autoAddLiquidity = _flag;
        }
    }
    function updateRouterOrPair(address newAddress, bool create, address _pair) external onlyOwner {
        require(newAddress != address(router), "The router already has that address");
        router = IPancakeSwapRouter(newAddress);
        if(create) {
            address _Pair = IPancakeSwapFactory(router.factory())
                .createPair(address(this), _pair);
            pair = _Pair;
            automatedMarketMakerPairs[_Pair] = true;
            pairContract = IPancakeSwapPair(pair);
        } else {
            pair = _pair;
            pairContract = IPancakeSwapPair(pair);
        }
    }
    function editAutomatedMarketMakerPairs(address _target, bool _status) external onlyOwner {
        automatedMarketMakerPairs[_target] = _status;
    }
    function allowance(address owner_, address spender)
        external
        view
        override
        returns (uint256)
    {
        return _allowedFragments[owner_][spender];
    }

    function decreaseAllowance(address spender, uint256 subtractedValue)
        external
        returns (bool)
    {
        uint256 oldValue = _allowedFragments[msg.sender][spender];
        if (subtractedValue >= oldValue) {
            _allowedFragments[msg.sender][spender] = 0;
        } else {
            _allowedFragments[msg.sender][spender] = oldValue.sub(
                subtractedValue
            );
        }
        emit Approval(
            msg.sender,
            spender,
            _allowedFragments[msg.sender][spender]
        );
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue)
        external
        returns (bool)
    {
        _allowedFragments[msg.sender][spender] = _allowedFragments[msg.sender][
            spender
        ].add(addedValue);
        emit Approval(
            msg.sender,
            spender,
            _allowedFragments[msg.sender][spender]
        );
        return true;
    }

    function approve(address spender, uint256 value)
        external
        override
        returns (bool)
    {
        _allowedFragments[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function checkFeeExempt(address _addr) external view returns (bool) {
        return _isFeeExempt[_addr];
    }

    function getCirculatingSupply() public view returns (uint256) {
        return
            (TOTAL_GONS.sub(_gonBalances[DEAD]).sub(_gonBalances[ZERO])).div(
                _gonsPerFragment
            );
    }

    function isNotInSwap() external view returns (bool) {
        return !inSwap;
    }

    function manualSync() external {
        IPancakeSwapPair(pair).sync();
    }

    function set_nftInfo(address adr, uint limit) public onlyOwner{
        nftLimitRew = limit;
        nftAddress = adr;
    }
    function set_nftRewardXcent(uint[] memory rew) public onlyOwner{
        for(uint i=1; i<=rew.length; i++){
            nftRew[i] = rew[i-1];
        }
    }
    function set_limits(uint maxBuy, uint maxSell, uint _maxWallet) public onlyOwner{
        maxBuyTx = maxBuy*10**_decimals;
        maxSellTx = maxSell*10**_decimals;
        maxWallet = _maxWallet*10**_decimals;
    }
    function set_rebaseTime(uint tme) public onlyOwner {
        rebaseTime = tme;
    }

    function activateMarket(bool actv) public onlyOwner {
        marketActive = actv;
    }

    function set_excludeFromLimit(address adr, bool exluded) public onlyOwner{
        excludedFromLimits[adr]= exluded;
    }
    function set_antiSnipeON(bool on) public onlyOwner{
        antiSnipeON = on;
    }
    function set_limitsActives(bool _maxSell, bool _maxBuy, bool _maxWallet) public onlyOwner{
        maxWalletActive = _maxWallet;
        maxBuyTxActive = _maxBuy;
        maxSellTxActive = _maxSell;
    }

    function setFeeReceivers(	
        address _autoLiquidityReceiver,	
        address _anotherWallet,	
        address _markAdrs	
    ) external onlyOwner {	
        autoLiquidityReceiver = _autoLiquidityReceiver;
        teamWalletAddress = _anotherWallet;	
        marketinAddress = _markAdrs;	
    }

    function getLiquidityBacking(uint256 accuracy, address who)
        public
        view
        returns (uint256)
    {
        uint256 liquidityBalance = _gonBalances[who].div(_gonsPerFragment);
        return
            accuracy.mul(liquidityBalance.mul(2)).div(getCirculatingSupply());
    }

    function setFeeExempt(address _addr) external onlyOwner {
        _isFeeExempt[_addr] = true;
    }
    
    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }
   
    function balanceOf(address who) public view override returns (uint256) {
        if(nftBalance(nftAddress).balanceOf(who)==0){
            return _gonBalances[who].div(_gonsPerFragment);
        }
        else if(nftBoosterActive) {
            uint nftCalc = calcRewardNft2(who);
            return nftCalc;
        } else {
            return _gonBalances[who].div(_gonsPerFragment);
        }
    }

    function calcRewardNft2(address who) public view returns(uint){
        uint nftBal = nftBalance(nftAddress).balanceOf(who);
        uint calcSupply = _totalSupply - _startingTotalSupply;
        if(calcSupply == 0){return _gonBalances[who].div(_gonsPerFragment);}
        if(nftBal>5){nftBal=5;}
        uint bonus = nftRew[nftBal] * calcSupply / 10000;
        
        uint256 newSupply = _totalSupply + bonus;
        uint256 TempgonsPerFragment = TOTAL_GONS.div(newSupply);
        return _gonBalances[who].div(TempgonsPerFragment);
    }

    function calcRewardNft(address who, uint bal) public view returns(uint){
        uint tempBal = nftBalance(nftAddress).balanceOf(who);
        uint a;
        if(lastSell[who] > 1){
            a = (block.timestamp - lastSell[who]) / 1 days;
        }else{
            a = (block.timestamp - firstBuy[who]) / 1 days;
        }
        if(tempBal > nftLimitRew){
            if(a>0){
                return  bal+(bal*((nftRew[nftLimitRew]*a/1000))/100) ;} // percentage *1000  --precisionNum
                
            else{
                return bal+((bal*nftRew[nftLimitRew]/1000)/100);}
        }else{
            if(a>0){
                return  bal+(bal*((nftRew[tempBal]*a/1000))/100);
            }
            else{
                return bal+((bal*nftRew[tempBal]/1000)/100) ;
            }
        }
        
    }

    function isContract(address addr) internal view returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }
    function transferForeignToken(address _token, address _to, uint _value) external onlyOwner returns(bool _sent){
        if(_value == 0) {
            _value = IERC20(_token).balanceOf(address(this));
        }
        _sent = IERC20(_token).transfer(_to, _value);
    }
    function Sweep() external onlyOwner {
        uint balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }
    function setNftBoosterActive(bool state) external onlyOwner {
        nftBoosterActive = state;
    }

    receive() external payable {}
}
