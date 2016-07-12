{ 
	alreadyAdded = false;

	if(substr($0,1,1) != " ") 
	{ 
		if (substr($0,2,1) != " ") 
		{
			system (cmd " " $2); 
			exit;
		}
		print "> "$0;
	} 
	else 
	{
		system (cmd " " $2); 
		exit;
	}
}