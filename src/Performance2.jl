module Performance2

export unique_2loops, unique_set
export create_hashtable, push_hashtable!

function unique_2loops(list::AbstractVector)
    # Implement your own version of `unique`, a function that will return a new vector containing
    # each unique item in `list` (i.e., it drops duplicates).
    newlist = eltype(list)[]
    # Here, use two nested `for` loops to `push!` items onto `newlist` only if they do not appear
    # earlier in the list

    return newlist
end

function unique_set(list::AbstractVector)
    # Implement a second version of `unique`.
    # This time, insert all the items from `list` into a `Set` and then collect(set)
end

###
### Below here, you don't need to modify any code. But you should read & understand it!
### This is a very simple (and incorrect) "hash table" intended a taste for how `Set`s work;
### it is in no way intended as a serious implementation.
###

"""
    create_hashtable(::Type{T}, tablesize) → ht

Create an empty "hash table," here just a list of length `tablesize`, each element itself a list that can store all items
with the same index as computed by [`hash2index`](@ref).
"""
create_hashtable(::Type{T}, tablesize::Int) where T = [T[] for _ = 1:tablesize]

"""
    hash2index(x, tablesize) → idx

Compute the proper index `idx` for `x`, given a hash table of length `tablesize`.
"""
hash2index(x, tablesize::Int) = (hash(x) % tablesize) + 1

"""
    push_hashtable!(table, x)

Append `x` to the sub-list of items with index `idx` as computed by [`hash2index`](@ref).

!!! warning
    There is no protection against duplicates. The intended usage is to add each unique item
    and see how many "collisions" you have.
"""
push_hashtable!(table, x) = push!(table[hash2index(x, length(table))], x)

end
