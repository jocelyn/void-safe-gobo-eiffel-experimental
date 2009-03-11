indexing

	description:

		"Labeled types appearing in symbol Tuple types"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2009-03-06 23:53:42 +0100 (Fri, 06 Mar 2009) $"
	revision: "$Revision: 6603 $"

class PR_LABELED_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_labels: like labels; a_type: like type) is
			-- Create a new labeled type.
		require
			a_labels_not_void: a_labels /= Void
			a_labels_not_empty: not a_labels.is_empty
			no_void_label: not a_labels.has_void
			a_type_not_void: a_type /= Void
		do
			labels := a_labels
			type := a_type
		ensure
			labels_set: labels = a_labels
			type_set: type = a_type
		end

feature -- Access

	labels: DS_ARRAYED_LIST [STRING]
			-- labels

	type: PR_TYPE
			-- Type

invariant

	labels_not_void: labels /= Void
	labels_not_empty: not labels.is_empty
	no_void_label: not labels.has_void
	type_not_void: type /= Void

end