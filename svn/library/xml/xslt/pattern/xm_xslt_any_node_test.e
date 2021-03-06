indexing

	description:

		"XSLT patterns that matches any node"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date: 2007-01-26 19:55:25 +0100 (Fri, 26 Jan 2007) $"
	revision: "$Revision: 5877 $"

class XM_XSLT_ANY_NODE_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			super_type, matches_item
		redefine
			default_priority
		end

	XM_XPATH_ANY_NODE_TEST
		rename 
			make as make_xpath
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			system_id := ""
			line_number := -1
			initialize_dependencies
			make_xpath
		end
	
feature -- Access

		frozen default_priority: MA_DECIMAL is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
				create Result.make_from_string ("-0.5")
		end
	
end
	
