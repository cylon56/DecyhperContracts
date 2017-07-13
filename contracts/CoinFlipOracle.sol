import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract CoinFlipOracle is usingOraclize
{
	string public result;
	bytes32 public oraclizeID;

	function flipCoin() payable
	{
		oraclizeID = oraclize_query("WolframAlpha", "flip a coin");
	}

	function __callback(bytes _oraclizeID, string _result)
	{
		if(msg.sender != oraclize_cbAddress()) throw;
		result = _result;
	}
}