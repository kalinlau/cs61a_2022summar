from importlib.resources import path


class Pet():
    def __init__(self, name, owner):
        self.is_alive = True    # It's alive!!!
        self.name = name
        self.owner = owner
    def eat(self, thing):
        print(self.name + " ate a " + str(thing) + "!")
    def talk(self):
        print(self.name)

class Cat(Pet):
    """Q1 of Disc6"""
    def __init__(self, name, owner, lives=9):
        "*** YOUR CODE HERE ***"
        super().__init__(name, owner)
        self.lives = lives

    def talk(self):
        """Print out a cat's greeting.

        >>> Cat('Thomas', 'Tammy').talk()
        Thomas says meow!
        """
        "*** YOUR CODE HERE ***"
        print(self.name, 'says meow!')

    def lose_life(self):
        """Decrements a cat's life by 1. When lives reaches zero,
        is_alive becomes False. If this is called after lives has
        reached zero, print 'This cat has no more lives to lose.'
        """
        "*** YOUR CODE HERE ***"
        if not self.is_alive:
            print('This cat has no more lives to lose.')
            return
        self.lives -= 1
        if self.lives == 0:
            self.is_alive = False

class NoisyCat(Cat):
    """Q2 of disc6 """

    # __init__ here is not necessary because nothing new
    # from its parent

    def talk(self):
        for i in range(2):
            print(f'{self.name} says meow!')

def best_k_segmenter(k, score):
    """
    >>> largest_digit_getter = best_k_segmenter(1, lambda x: x)
    >>> largest_digit_getter(12345)
    5
    >>> largest_digit_getter(245351)
    5
    >>> largest_pair_getter = best_k_segmenter(2, lambda x: x)
    >>> largest_pair_getter(12345)
    45
    >>> largest_pair_getter(245351)
    53
    >>> best_k_segmenter(1, lambda x: -x)(12345)
    1
    >>> best_k_segmenter(3, lambda x: (x // 10) % 10)(192837465)
    192
    """
    partitioner = lambda x: ( x // 10 ** k, x % 10 ** k)
    def best_getter(n):
        assert n > 0
        best_seg = None
        while n > 0:
            n, seg = partitioner(n)
            if best_seg == None or score(seg) > score(best_seg):
                best_seg = seg
        return best_seg
    return best_getter

def ten_pairs(n):
    q = n // 10
    r = n % 10

    if q == 0:
        return 0

    return count_digit(q, 10 - r) + ten_pairs(q)

def count_digit(n, digit):
    q = n // 10
    r = n % 10
    if q == 0:
        if r == digit:
            return 1
        else:
            return 0
    return 1 + count_digit(q, digit) if r == digit else count_digit(q, digit)

def make_onion(f, g):
    """
    Write a function make_onion that takes in two one-argument
    functions, F and G, and returns a function that will take in
    X, Y, and LIMIT and return True if it is possible to reach Y
    from X in LIMIT steps or less, via only repeated applications
    of F and G, and False otherwise.

    >>> add_one = lambda x: x + 1
    >>> mul_by_two = lambda y: y * 2
    >>> can_reach = make_onion(add_one, mul_by_two)
    >>> can_reach(0, 5, 4)      # 5 = add_one(mul_by_two(mul_by_two(add_one(0))))
    True
    >>> can_reach(0, 5, 3)      # Not possible
    False
    >>> can_reach(1, 1, 0)      # 1 = 1
    True
    >>> add_ing = lambda x: x + "ing"
    >>> add_end = lambda y: y + "end"
    >>> can_reach_string = make_onion(add_ing, add_end)
    >>> can_reach_string("cry", "crying", 1)      # "crying" = add_ing("cry")
    True
    >>> can_reach_string("un", "unending", 3)      # "unending" = add_ing(add_end("un"))
    True
    >>> can_reach_string("peach", "folding", 4)      # Not possible
    False
    """
    def can_reach(x, y, limit):
        if y == x:
            return True
        elif limit == 0:
            return False
        else:
            return can_reach(f(x), y, limit - 1) or can_reach(g(x), y, limit - 1)
    return can_reach

def paths(x, y):
    if x > y:
        return []
    elif x == y:
        return [[x]]
    else:
        a = [[x] + i for i in paths(x + 1, y)]
        b = [[x] + i for i in paths(x * 2, y)]
        return a + b

def knapsack(w, v, c):
    if w == []:
        return 0
    return w[0] if w[0] <= c and v[0] > knapsack(w[1:], v[1:], c) else \
        knapsack(w[1:], v[1:], c)