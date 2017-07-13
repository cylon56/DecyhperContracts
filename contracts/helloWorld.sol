import "./Owned.sol"

contract helloWorld is Owned //will take functionality of Owned contract
{
	string public message;

	function setMessage(string _message) onlyOwner()
	{
		message = _message;
	}
}