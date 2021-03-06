indexing

	description:

		"Objects that implement the XPath max() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date: 2007-01-26 19:55:25 +0100 (Fri, 26 Jan 2007) $"
	revision: "$Revision: 5877 $"

class XM_XPATH_MAX

inherit

	XM_XPATH_MINIMAX_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "max"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Max_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			is_max := True
			initialized := True
		end

end
	
