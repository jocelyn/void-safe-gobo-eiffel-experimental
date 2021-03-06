indexing

	description:

		"Imported unicode routines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2007-01-26 19:55:25 +0100 (Fri, 26 Jan 2007) $"
	revision: "$Revision: 5877 $"

class UC_IMPORTED_UNICODE_ROUTINES

feature -- Access

	unicode: UC_UNICODE_ROUTINES is
			-- Unicode routines
		once
			create Result
		ensure
			unicode_not_void: Result /= Void
		end

end
