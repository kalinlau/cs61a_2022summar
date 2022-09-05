# Scratch on Section 2.7
#
# Multi-representation
#
# LIU Jialin.
# Fri Aug 12, 2022.
# ==============================================================================


# Multi-Representation: My Version
#
# class Number:
#     def __add__(self, other):
#         return self.add(other)
#     def __mul__(self, other):
#         return self.mul(other)

# class Z(Number):
#     def __init__(self, x, y):
#         self.x = x
#         self.y = y

#     def add(self, z):
#         return Z(self.x + z.x, self.y + z.y)

#     def mul(self, z):
#         """Cartesian product of complex number.

#         (x_1 + iy_1)(x_2 + iy_2) = (x_1x_2 - y_1y_2) + i(x_1y_2 + x_2y_1)
#         """
#         real = self.x * z.x - self.y * z.y
#         image = self.x * z.y + z.x * self.y
#         return Z(real, image)

# class Z(Number):
#     def __init__(self, p: dict):
#         self.r = p['radius']
#         self.a = p['angle']


"""
Multi-Representation: Lecture Version
"""
# key point: interface + message passing
#
# Cross-type of data
#
# 1. property: zero-arg function by @property
# 2. interfaces: real, imag, magnitude, angle
# 3. message passing: by class.method


# key point: type dispatching
#
# Cross-type of Operation
#
# 1. type tag for dispatching.
# 2. enumerate operation combination.


# key point: type coercion (maybe unavailable)
#
# Cross-type of data + operation
#
# transformation