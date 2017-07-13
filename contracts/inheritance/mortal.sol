contract mortal
{
	address public owner;

	function mortal()
	{
		owner = msg.sender;
	}

	modifier onlyOwner()
	{
		//modifer makes function only callable by the owner of the contract
		if(msg.sender == owner){_;}
	}

	function kill() onlyOwner()
	{
		selfdestruct(owner);
	}


}