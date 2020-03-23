# Name: Dinh Nguyen
# CS 265 filter.awk
# Parse README and save outputs to 2 files: .index and .required

BEGIN{FS = ":"}
{
	if ($1 == "index")
	{
		print $2 > ".index"
	}
	else if ($1 == "required")
	{ 
		for (i=2; i<NF+1; i++)
		{
			print $i >> ".required"
		}
	}
}
END{
}
