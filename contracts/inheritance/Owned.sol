contract Owned
{
	address public owner;

	function Owned()
	{
		owner = msg.sender;
	}

	modifier onlyOwner()
	{
		//modifer makes function only callable by the owner of the contract
		if(msg.sender == owner){_;}
	}


}

contract helloWorld is Owned //will take functionality of Owned contract
{
	string public message;

	function setMessage(string _message) onlyOwner()
	{
		message = _message;
	}
}