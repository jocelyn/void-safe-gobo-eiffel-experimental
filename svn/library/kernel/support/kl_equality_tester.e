indexing

	description:

		"Equality testers"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2009-03-02 18:28:36 +0100 (Mon, 02 Mar 2009) $"
	revision: "$Revision: 6595 $"

class KL_EQUALITY_TESTER [G]

inherit

	ANY

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Status report

	test (v, u: ?G): BOOLEAN is
			-- Are `v' and `u' considered equal?
			-- (Use `equal' by default.)
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := ANY_.equal_objects (v, u)
			end
		end

end
