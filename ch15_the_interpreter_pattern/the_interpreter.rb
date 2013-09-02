# This design pattern is to be used when the best way to solve a problem is to invent a new language.  

# Lets say we need to evaluate the following statement:

4 * ( 3 - 1 )

# We can solve this with an interpreter.  Interpreters work in two phases:
# => The parser must produce an AST and
# => Evaluation of the AST.

# 1. The parser reads the program text and produces an AST (abstract syntax tree).
# The AST is a data structure that gives us a way to represent the information of the given problem in the form of a tree of objects.
# In the tree of our example the the leaf nodes are referred to as terminals.  Terminals represent the most
# basic building blocks of the language.  The 4, 3 and 1 are terminals.

# The non-leaf nodes are called nonterminals, which represent higher-ordered concepts in the language.
# In our example the * and - are the non-leaf nodes.

# 2. The AST is evaluated.  4 * ( 3 - 1 ) = 8.  This is evaluated recursively.  The root node, *
# evaluates itself.  It recursively tries to evaluate 4 and - , then 3 - 1.  3 - 1 is 2 and 4 * 2 is 8.  Boom.