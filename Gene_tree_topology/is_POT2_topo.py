import sys
import ete2
from ete2 import Tree

tree_file = sys.argv[1]
Leaves = []
for line in sys.stdin:
    t = Tree(line[:-1])
    for leaf in t:
        Leaves.append(leaf.name)
    for l in Leaves:
        if l[:3] == "B71":
            b71 = t&l
            tmp1 = Leaves[:]
            tmp1.remove(l)
            b_closest = min(tmp1, key=lambda x: b71.get_distance(x))
            if b_closest[:3] == "GUY":
                guy = t&b_closest
                tmp2 = Leaves[:]
                tmp2.remove(b_closest)
                g_closest = min(tmp2, key=lambda x: guy.get_distance(x))
                if g_closest == b71.name:
                    print '\t'.join([tree_file, b71.name, guy.name, b71.get_distance(b_closest)])
                    print line
                    break

