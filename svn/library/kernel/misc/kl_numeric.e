indexing

	description:

		"Properties of numeric types"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2004-2008, Paul G. Crismer and others"
	license: "MIT License"
	date: "$Date: 2008-12-23 16:09:12 +0100 (Tue, 23 Dec 2008) $"
	revision: "$Revision: 6570 $"

deferred class KL_NUMERIC

inherit

	NUMERIC
		rename
			infix "+" as plus alias "+",
			infix "-" as minus alias "-",
			infix "*" as product alias "*",
			infix "/" as quotient alias "/",
			prefix "+" as identity alias "+",
			prefix "-" as opposite alias "-"
		end

end
