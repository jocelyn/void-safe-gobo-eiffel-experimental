indexing

	description:

		"Objects that make security decisions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date: 2007-01-26 19:55:25 +0100 (Fri, 26 Jan 2007) $"
	revision: "$Revision: 5877 $"

deferred class XM_XPATH_SECURITY_MANAGER

feature -- Access
	
	is_uri_permitted (an_absolute_uri: UT_URI): BOOLEAN is
			-- Is reading permitted from `an_absolute_uri'?
		require
			absolute_uri: an_absolute_uri /= Void and then an_absolute_uri.is_absolute
		deferred
		end

end
	
