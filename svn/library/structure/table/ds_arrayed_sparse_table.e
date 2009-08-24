indexing

	description:

		"Sparse tables implemented with single arrays. Ancestor of %
		%hash tables which should supply its hashing mechanism."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2008-09-28 20:40:54 +0200 (Sun, 28 Sep 2008) $"
	revision: "$Revision: 6526 $"

deferred class DS_ARRAYED_SPARSE_TABLE [G, K]

inherit

	DS_SPARSE_TABLE [G, K]
		redefine
			new_cursor
		end

	KL_IMPORTED_SPECIAL_ROUTINES
		undefine
			is_equal,
			copy
		end

feature -- Access

	new_cursor: DS_ARRAYED_SPARSE_TABLE_CURSOR [G, K] is
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature {DS_ARRAYED_SPARSE_TABLE_CURSOR} -- Implementation

	item_storage_item (i: INTEGER): G is
			-- Item at position `i' in `item_storage'
		do
			Result := item_storage.item (i - 1)
		end

	item_storage_put (v: G; i: INTEGER) is
			-- Put `v' at position `i' in `item_storage'.
		do
			item_storage.force (v, i - 1)
		end

--	item_storage_put_default (i: INTEGER) is
--			-- Put default value at position `i' in `item_storage'.
--		local
--			v: ?G
--		do
--			item_storage.put (v, i - 1)
--		end

--	item_storage_item_is_default (i: INTEGER): BOOLEAN is
--			-- Is item at position `i' in `item_storage' a default value?
--		local
--			v: ?G
--		do
--			Result := item_storage.item (i - 1) = v
--		end

	key_storage_item (i: INTEGER): K is
			-- Item at position `i' in `key_storage'
		do
			Result := key_storage.item (i - 1)
		end

	clashes_item (i: INTEGER): INTEGER is
			-- Item at position `i' in `clashes'
		do
			Result := clashes.item (i)
		end

feature {NONE} -- Implementation

	item_storage: SPECIAL [G]
			-- Storage for items of the table indexed from 1 to `capacity'

	make_item_storage (n: INTEGER) is
			-- Create `item_storage'.
		do
			create special_item_routines
			item_storage := special_item_routines.make (n)
		end

	clone_item_storage is
			-- Clone `item_storage'.
		do
			item_storage := item_storage.twin
		end

	item_storage_resize (n: INTEGER) is
			-- Resize `item_storage'.
		do
			item_storage := special_item_routines.resize (item_storage, n)
		end

	item_storage_keep_head (n: INTEGER) is
			-- Keep the first `n' items in `item_storage'.
		do
			item_storage.keep_head (n)
		end

	item_storage_wipe_out is
			-- Wipe out items in `item_storage'.
		local
			i: INTEGER
		do
			item_storage.wipe_out
			-- could be optimized?
		end

	key_storage: SPECIAL [K]
			-- Storage for keys of the table indexed from 1 to `capacity'

	make_key_storage (n: INTEGER) is
			-- Create `key_storage'.
		do
			create special_key_routines
			key_storage := special_key_routines.make (n)
		end

	key_storage_put (k: K; i: INTEGER) is
			-- Put `k' at position `i' in `key_storage'.
		do
			key_storage.force (k, i - 1)
		end

	key_storage_put_default (i: INTEGER) is
			-- Put default value at position `i' in `key_storage'.
		local
			v: ?K
		do
--			key_storage.put (v, i - 1)
		end

	clone_key_storage is
			-- Clone `key_storage'.
		do
			key_storage := key_storage.twin
		end

	key_storage_resize (n: INTEGER) is
			-- Resize `key_storage'.
		do
			key_storage := special_key_routines.resize (key_storage, n)
		end

	key_storage_wipe_out is
			-- Wipe out items in `key_storage'.
		do
			key_storage.wipe_out
			-- could be optimized?
		end

	key_storage_keep_head (n: INTEGER) is
			-- Keep the first `n' items in `key_storage'.
		do
			key_storage.keep_head (n)
		end

	clashes: SPECIAL [INTEGER]
			-- Indexes in `item_storage' and `key_storage' when there are clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of free
			-- slot positions located before or at `last_position' with
			-- indexes less that or equal to `Free_watermark'.

	make_clashes (n: INTEGER) is
			-- Create `clashes'.
		do
			clashes := SPECIAL_INTEGER_.make_filled (0, n)
		end

	clashes_put (v: INTEGER; i: INTEGER) is
			-- Put `v' at position `i' in `clashes'.
		do
			clashes.put (v, i)
		end

	clone_clashes is
			-- Clone `clashes'.
		do
			clashes := clashes.twin
		end

	clashes_resize (n: INTEGER) is
			-- Resize `clashes'.
		do
			clashes := SPECIAL_INTEGER_.resize_with_default (0, clashes, n)
		end

	clashes_wipe_out is
			-- Wipe out items in `clashes'.
		local
			i: INTEGER
		do
			from
				i := last_position
			until
				i < 1
			loop
				clashes.put (No_position, i)
				i := i - 1
			end
		end

	slots: SPECIAL [INTEGER]
			-- Indexes in `item_storage' and `key_storage', indexed by hash codes
			-- from 0 to `modulus' (the entry at index `modulus'
			-- being reserved for void items)

	make_slots (n: INTEGER) is
			-- Create `slots'.
		do
			slots := SPECIAL_INTEGER_.make_filled (0, n)
		end

	slots_item (i: INTEGER): INTEGER is
			-- Item at position `i' in `slots'
		do
			Result := slots.item (i)
		end

	slots_put (v: INTEGER; i: INTEGER) is
			-- Put `v' at position `i' in `slots'.
		do
			slots.put (v, i)
		end

	clone_slots is
			-- Clone `slots'.
		do
			slots := slots.twin
		end

	slots_resize (n: INTEGER) is
			-- Resize `slots'.
		do
			slots := SPECIAL_INTEGER_.resize_with_default (0, slots, n)
		end

	slots_wipe_out is
			-- Wipe out items in `slots'.
		local
			i: INTEGER
		do
			from
				i := modulus
			until
				i < 0
			loop
				slots.put (No_position, i)
				i := i - 1
			end
		end

	special_item_routines: KL_SPECIAL_ROUTINES [G]
			-- Routines that ought to be in SPECIAL

	special_key_routines: KL_SPECIAL_ROUTINES [K]
			-- Routines that ought to be in SPECIAL

invariant

	item_storage_not_void: item_storage /= Void
	item_storage_count: item_storage.capacity = capacity -- + 1
	key_storage_not_void: key_storage /= Void
	key_storage_count: key_storage.capacity = capacity -- + 1
	clashes_not_void: clashes /= Void
	clashes_count: clashes.count = capacity + 1
	slots_not_void: slots /= Void
	slots_count: slots.count = modulus + 1

end
