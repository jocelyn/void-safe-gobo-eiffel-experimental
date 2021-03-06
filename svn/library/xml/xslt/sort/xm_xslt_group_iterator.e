indexing

	description:

		"Iterators over groups. `item' Always points to first item in group"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date: 2007-07-16 10:15:34 +0200 (Mon, 16 Jul 2007) $"
	revision: "$Revision: 6004 $"

deferred class	XM_XSLT_GROUP_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]

	XM_XPATH_ERROR_TYPES

feature -- Access

	current_grouping_key: XM_XPATH_ATOMIC_VALUE is
			-- Grouping key for current group;
			-- (or `Void' for group-starting/ending-with)
		deferred
		end

feature -- Status report

	is_group_node_iterator: BOOLEAN is
			-- Is `Current' a group-node-iterator?
		do
			Result := False
		end

feature -- Evaluation

	current_group_iterator: XM_XPATH_SEQUENCE_ITERATOR [G] is
			-- Iterator over the members of the current group, in population order.
		deferred
		end

feature -- Conversion

	as_group_node_iterator: XM_XSLT_GROUP_NODE_ITERATOR is
			-- `Current' seen as a group-node-iterator.
		require
			group_node_iterator: is_group_node_iterator
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

end
	
