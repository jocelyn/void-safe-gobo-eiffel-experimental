indexing

	description:

		"Test case failed results"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2007-01-26 19:55:25 +0100 (Fri, 26 Jan 2007) $"
	revision: "$Revision: 5877 $"

class TS_FAILED_RESULT

inherit

	TS_RESULT
		redefine
			failed
		end

create

	make

feature {NONE} -- Initialization

	make (a_test: like test; a_reason: like reason) is
			-- Create a new failed result associated with `a_test'.
		require
			a_test_not_void: a_test /= Void
			a_reason_not_void: a_reason /= Void
		do
			test := a_test
			reason := a_reason
		ensure
			test_set: test = a_test
			reason_set: reason = a_reason
		end

feature -- Access

	reason: STRING
			-- Failure reason

feature -- Status report

	failed: BOOLEAN is True
			-- Has `test' failed?

feature -- Output

	print_result (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print result to `a_file'.
		do
			a_file.put_string ("FAIL:  [")
			a_file.put_string (test.name)
			a_file.put_string ("] ")
			a_file.put_string (reason)
		end

invariant

	reason_not_void: reason /= Void

end
