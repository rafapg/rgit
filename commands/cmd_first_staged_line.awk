{ 
	staged_status=substr($0,1,1);
	not_staged_status=substr($0,2,1);

	renamed = "R";
	modified = "M";
	added = "A";
	deleted = "D";
	null_status = " ";

	if (not_staged_status != null_status)
	{
		if (staged_status == renamed)
		{
			targetFile = $4;
		}
		else
		{
			targetFile = $2;
		}
		print ("[ " staged_status " | " not_staged_status " ] EXEC: " cmd " " targetFile) "\n\n";
		print "";
		system (cmd " " targetFile);
		exit;
	}
}