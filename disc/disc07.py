def height(t):
    """Return the height of a tree.
    """
    if t.branches == []:
        return 0
    else:
        return 1 + max([height(i) for i in t.branches])

def max_path_sum(t):
    """Return the maximum path sum of the tree.

    >>> t = Tree(1, [Tree(5, [Tree(1), Tree(3)]), Tree(10)])
    >>> max_path_sum(t)
    11
    """
    "*** YOUR CODE HERE ***"
    if t.branches == []:
        return t.label
    return max([t.label + max_path_sum(i) for i in t.branches])

def find_path(t, x):
    """
    >>> t = Tree(2, [Tree(7, [Tree(3), Tree(6, [Tree(5), Tree(11)])]), Tree(15)])
    >>> find_path(t, 5)
    [2, 7, 6, 5]
    >>> find_path(t, 10)  # returns None
    """
    if t.branches == [] and t.label == x:
        return [t.label]
    for i in t.branches:
        path = find_path(i, x)
        if path != None:
            return [t.label] + path

def prune_small(t, n):
    """Prune the tree mutatively, keeping only the n branches
    of each node with the smallest label.

    >>> t1 = Tree(6)
    >>> prune_small(t1, 2)
    >>> t1
    Tree(6)
    >>> t2 = Tree(6, [Tree(3), Tree(4)])
    >>> prune_small(t2, 1)
    >>> t2
    Tree(6, [Tree(3)])
    >>> t3 = Tree(6, [Tree(1), Tree(3, [Tree(1), Tree(2), Tree(3)]), Tree(5, [Tree(3), Tree(4)])])
    >>> prune_small(t3, 2)
    >>> t3
    Tree(6, [Tree(1), Tree(3, [Tree(1), Tree(2)])])
    """
    while len(t.branches) > n:
        largest = max(t.branches, key=lambda t: t.label)
        t.branches.remove(largest)
    for i in t.branches:
        prune_small(i, n)

def remove_all(link, value):
    """Remove all the nodes containing value in link. Assume that the
    first element is never removed.

    >>> l1 = Link(0, Link(2, Link(2, Link(3, Link(1, Link(2, Link(3)))))))
    >>> print(l1)
    <0 2 2 3 1 2 3>
    >>> remove_all(l1, 2)
    >>> print(l1)
    <0 3 1 3>
    >>> remove_all(l1, 3)
    >>> print(l1)
    <0 1>
    >>> remove_all(l1, 3)
    >>> print(l1)
    <0 1>
    """
    "*** YOUR CODE HERE ***"
    if link.rest != Link.empty:
        if link.rest.first == value:
            link.rest = link.rest.rest
            remove_all(link, value)
        else:
            remove_all(link.rest, value)

def slice_link(link, start, end):
    """Slices a Link from start to end (as with a normal Python list).

    >>> link = Link(3, Link(1, Link(4, Link(1, Link(5, Link(9))))))
    >>> new = slice_link(link, 1, 4)
    >>> print(new)
    <1 4 1>
    """
    "*** YOUR CODE HERE ***"
    while start > 0 and link != Link.empty:
        link = link.rest
        start -= 1

    res = link
    ptr = res

    while end - start - 1 > 1 and link != Link.empty:
        ptr = ptr.rest
        end -= 1

    ptr.rest = Link.empty
    return res