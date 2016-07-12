{ 
	alreadyAdded = false;

	if(substr($0,1,1) == "M") 
	{
		if (substr($0,1,2) == "MM") 
		{
			system ("git diff "$2); 
			exit;
		}
		print $0;
	} 
	else 
	{
		system ("git diff "$2); 
		exit;
	}
}