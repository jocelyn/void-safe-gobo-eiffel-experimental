note

	description:
		"Containers whose items are accessible through keys"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: table, access;
	access: key, membership;
	contents: generic;
	date: "$Date: 2009-01-12 17:05:16 +0100 (Mon, 12 Jan 2009) $"
	revision: "$Revision: 6572 $"

deferred class TABLE [G, H] inherit

	BAG [G]
		rename
			put as bag_put
		end

feature -- Access

	item alias "[]", at alias "@" (k: H): G assign force
			-- Entry of key `k'.
		require
			valid_key: valid_key (k)
		deferred
		end

feature -- Status report

	valid_key (k: H): BOOLEAN
			-- Is `k' a valid key?
		deferred
		end

feature -- Element change

	put (v: G; k: H)
			-- Associate value `v' with key `k'.
		require
			valid_key: valid_key (k)
		deferred
		end

	force (v: G; k: H)
			-- Associate value `v' with key `k'.
		require
			valid_key: valid_key (k)
		deferred
		ensure
			inserted: item (k) = v
		end

feature {NONE} -- Inapplicable

	bag_put (v: G)
		do
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end -- class TABLE



