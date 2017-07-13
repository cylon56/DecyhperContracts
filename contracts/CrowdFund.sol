contract CrowdFund 
{
	address public benenficiary;
	uint256 public goal;
	uint256 public deadline;
	address[] funderAddresses;

	//use mapping instead of struct code below
	mapping (address => uint256) funders;

	event NewContribution(address indexed _from, uint256 _value);

	/*uint256 public refundIndex;

	struct Funder
	{
		address addr;
		uint256 contribution;
	}

	Funder[] funders;*/

	function CrowdFund(address _benficiary, uint256 _goal, uint256 _duration)
	{
		benenficiary = _benficiary;
		goal = _goal;
		deadline = now + _duration;
	}

	function getFunderContribution(address _address) constant returns (uint)
	{
		return funders[_address];
	}

	function getFunderAddress(uint _index) constant returns (address)
	{
		return funderAddresses[_index];
	}

	function funderAddressLength() constant returns(uint)
	{
		return funderAddresses.length();
	}

	function contribute() payable
	{
		if(funders[msg.sender] == 0) funderAddresses.push(msg.sender);
		funders[msg.sender] += msg.value;
		//call event
		NewContribution(msg.sender, msg.value);
	}

	function payout()
	{
		if(this.balance >= goal && now > deadline) benenficiary.send(this.balance);
	}

	function refund()
	{
		//execute if deadline is passed and the goal wasn't met
		if(now > deadline && this.balance < goal)
		{
			//let user that calls refund recive refund
			msg.sender.send(funders[msg.sender]);
			//remove sender from funders to avoid repeated refunds
			funders[msg.sender] = 0;
		}

		/*//using loop with only the benficiary calling refunds 
		if(msg.sender != benenficiary) throw;
		uint256 index = refundIndex;
		while(index < founder.length && msg.gas > 100000)
		{
			funders[index].addr.send(funders[index].contribution);
			index++;
		}
		refundIndex = index;*/
	}
}