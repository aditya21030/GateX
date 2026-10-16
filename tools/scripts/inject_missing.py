import re

filepath = 'd:/Flutter/Gate DA/lib/screens/formula_sheet_screen.dart'
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Escape the $ in FOLLOW(Start symbol)
content = content.replace("$. is in FOLLOW", "\\$ is in FOLLOW")
content = content.replace("$ is in FOLLOW", "\\$ is in FOLLOW")

# 2. Add the missing methods before the closing bracket of the class
# The class is _FormulaSheetScreenState. Let's find the end of the file.
# We will insert it right before the last closing brace.

methods = """
  Widget _buildCSITDSATab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Arrays & Strings',
        items: [
          _FormulaItem(name: '1D Array Address', formula: '''Loc(A[i]) = Base + w * (i - LB)''', explanation: 'Address calculation for 1D Array. w = word size.'),
          _FormulaItem(name: 'Row Major 2D Array', formula: '''Loc(A[i][j]) = Base + w * [N * (i - Lr) + (j - Lc)]''', explanation: 'N is number of columns.'),
          _FormulaItem(name: 'Column Major 2D Array', formula: '''Loc(A[i][j]) = Base + w * [M * (j - Lc) + (i - Lr)]''', explanation: 'M is number of rows.'),
          _FormulaItem(name: 'String Length', formula: '''Length = Index of NULL (\\\\0) character''', explanation: 'Strings are character arrays terminated by NULL.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Stacks & Queues',
        items: [
          _FormulaItem(name: 'Stack Operations', formula: '''Push: Top = Top + 1; A[Top] = val\\nPop: val = A[Top]; Top = Top - 1''', explanation: 'LIFO data structure.'),
          _FormulaItem(name: 'Queue Operations', formula: '''Enqueue: Rear = Rear + 1; A[Rear] = val\\nDequeue: val = A[Front]; Front = Front + 1''', explanation: 'FIFO data structure.'),
          _FormulaItem(name: 'Circular Queue', formula: '''Next pos = (Current + 1) % Size\\nFull: (Rear + 1) % Size == Front''', explanation: 'Efficient memory utilization.'),
          _FormulaItem(name: 'Infix to Postfix', formula: '''Operands to output, Operators to Stack based on precedence.''', explanation: 'Standard expression conversion.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Trees & Binary Search Trees',
        items: [
          _FormulaItem(name: 'Max Nodes in Binary Tree', formula: '''Max Nodes at level L = 2^L\\nMax Nodes total (height H) = 2^(H+1) - 1''', explanation: 'Level starts at 0.'),
          _FormulaItem(name: 'Leaf Nodes', formula: '''Leaves (L) = Internal Nodes with 2 children (I2) + 1\\nL = I2 + 1''', explanation: 'Strictly binary tree property.'),
          _FormulaItem(name: 'BST Search', formula: '''If x == root, return. If x < root, search left. Else search right.''', explanation: 'O(h) time complexity.'),
          _FormulaItem(name: 'Tree Traversals', formula: '''Inorder: L N R\\nPreorder: N L R\\nPostorder: L R N''', explanation: 'N = Node, L = Left, R = Right.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Heaps & Graphs',
        items: [
          _FormulaItem(name: 'Min Heap Property', formula: '''A[Parent(i)] <= A[i]''', explanation: 'Root is minimum element.'),
          _FormulaItem(name: 'Max Heap Property', formula: '''A[Parent(i)] >= A[i]''', explanation: 'Root is maximum element.'),
          _FormulaItem(name: 'Graph Representation', formula: '''Adjacency Matrix: V x V space, O(1) edge query.\\nAdjacency List: V + E space, O(Degree) edge query.''', explanation: 'Space vs Time tradeoff.'),
          _FormulaItem(name: 'Graph Traversals', formula: '''BFS uses Queue.\\nDFS uses Stack.''', explanation: 'Fundamental graph exploration.'),
        ]
      )
    ]);
  }

  Widget _buildCSITAlgorithmsTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Asymptotic Analysis',
        items: [
          _FormulaItem(name: 'Big-O (Upper Bound)', formula: '''f(n) = O(g(n)) iff f(n) <= c * g(n) for n >= n0''', explanation: 'Worst case complexity.'),
          _FormulaItem(name: 'Omega (Lower Bound)', formula: '''f(n) = Ω(g(n)) iff f(n) >= c * g(n) for n >= n0''', explanation: 'Best case complexity.'),
          _FormulaItem(name: 'Theta (Tight Bound)', formula: '''f(n) = Θ(g(n)) iff c1*g(n) <= f(n) <= c2*g(n)''', explanation: 'Average case complexity.'),
          _FormulaItem(name: 'Master Theorem', formula: '''T(n) = aT(n/b) + f(n)\\nCompare n^(log_b(a)) with f(n)''', explanation: 'For divide and conquer recurrences.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Sorting Algorithms',
        items: [
          _FormulaItem(name: 'Bubble/Insertion/Selection', formula: '''Worst/Avg Case: O(n^2)\\nBest Case (Insertion): O(n)''', explanation: 'Basic comparison sorts.'),
          _FormulaItem(name: 'Merge Sort', formula: '''T(n) = 2T(n/2) + O(n) => O(n log n)''', explanation: 'Stable, Not in-place. Divide & Conquer.'),
          _FormulaItem(name: 'Quick Sort', formula: '''Worst: O(n^2)\\nAvg/Best: O(n log n)''', explanation: 'In-place, Not stable. Pivot based partitioning.'),
          _FormulaItem(name: 'Heap Sort', formula: '''Build Heap: O(n)\\nExtract Max n times: O(n log n)\\nTotal: O(n log n)''', explanation: 'In-place, Not stable.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Graph Algorithms',
        items: [
          _FormulaItem(name: 'Dijkstra (Shortest Path)', formula: '''Time: O((V+E)log V) with Min-Heap''', explanation: 'Single source shortest path. No negative edges.'),
          _FormulaItem(name: 'Bellman-Ford', formula: '''Time: O(VE)''', explanation: 'Single source shortest path. Handles negative edges.'),
          _FormulaItem(name: 'Floyd-Warshall', formula: '''Time: O(V^3)''', explanation: 'All-pairs shortest path. Dynamic Programming.'),
          _FormulaItem(name: 'Kruskal (MST)', formula: '''Time: O(E log E)''', explanation: 'Greedy. Sorts edges. Uses Disjoint Sets.'),
          _FormulaItem(name: 'Prim (MST)', formula: '''Time: O((V+E)log V)''', explanation: 'Greedy. Grows tree from arbitrary vertex.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Dynamic Programming & Greedy',
        items: [
          _FormulaItem(name: '0/1 Knapsack', formula: '''DP[i][w] = max(DP[i-1][w], val[i] + DP[i-1][w-wt[i]])''', explanation: 'Dynamic Programming approach. Time O(nW).'),
          _FormulaItem(name: 'Fractional Knapsack', formula: '''Sort by Value/Weight ratio''', explanation: 'Greedy approach. Time O(n log n).'),
          _FormulaItem(name: 'Longest Common Subsequence', formula: '''If matching: 1 + LCS(i-1, j-1)\\nElse: max(LCS(i-1, j), LCS(i, j-1))''', explanation: 'DP Time O(mn).'),
          _FormulaItem(name: 'Matrix Chain Multiplication', formula: '''M[i,j] = min(M[i,k] + M[k+1,j] + p_{i-1}p_kp_j)''', explanation: 'DP Time O(n^3).'),
        ]
      )
    ]);
  }

  Widget _buildCSITDBMSTab(BuildContext context) {
    return _buildSubjectTab(context, [
      _buildFormulaCard(
        context,
        title: 'Relational Model & Algebra',
        items: [
          _FormulaItem(name: 'Super Key', formula: '''Set of attributes that uniquely identifies a tuple.''', explanation: 'May contain redundant attributes.'),
          _FormulaItem(name: 'Candidate Key', formula: '''Minimal Super Key.''', explanation: 'No redundant attributes.'),
          _FormulaItem(name: 'Selection (σ)', formula: '''σ_condition(Relation)''', explanation: 'Selects rows.'),
          _FormulaItem(name: 'Projection (π)', formula: '''π_attributes(Relation)''', explanation: 'Selects columns.'),
          _FormulaItem(name: 'Cartesian Product (×)', formula: '''R × S''', explanation: 'Combines every tuple of R with every tuple of S.'),
          _FormulaItem(name: 'Natural Join (⨝)', formula: '''R ⨝ S''', explanation: 'Join over common attributes. Eliminates duplicate columns.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Normalization',
        items: [
          _FormulaItem(name: '1NF', formula: '''Domain of each attribute is atomic.''', explanation: 'No multi-valued attributes.'),
          _FormulaItem(name: '2NF', formula: '''1NF + No partial dependencies.''', explanation: 'Non-prime attribute fully functionally dependent on Candidate Key.'),
          _FormulaItem(name: '3NF', formula: '''2NF + No transitive dependencies.''', explanation: 'For X -> Y, X is Super Key OR Y is prime attribute.'),
          _FormulaItem(name: 'BCNF', formula: '''For every non-trivial FD X -> Y, X must be a Super Key.''', explanation: 'Stricter than 3NF.'),
          _FormulaItem(name: 'Lossless Join', formula: '''(R1 ∩ R2) -> R1 OR (R1 ∩ R2) -> R2''', explanation: 'Intersection must be a key for at least one decomposed relation.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Transactions & Concurrency',
        items: [
          _FormulaItem(name: 'ACID Properties', formula: '''Atomicity, Consistency, Isolation, Durability''', explanation: 'Fundamental transaction requirements.'),
          _FormulaItem(name: 'Conflict Serializability', formula: '''Precedence graph has no cycles.''', explanation: 'Ensures equivalent to some serial schedule.'),
          _FormulaItem(name: 'Two-Phase Locking (2PL)', formula: '''Phase 1: Growing (Acquire locks)\\nPhase 2: Shrinking (Release locks)''', explanation: 'Guarantees conflict serializability. May cause deadlock.'),
          _FormulaItem(name: 'Timestamp Ordering', formula: '''Transaction T_i gets timestamp TS(T_i).\\nRead/Write operations ordered by TS.''', explanation: 'Prevents deadlocks. Ensures serializability.'),
        ]
      ),
      _buildFormulaCard(
        context,
        title: 'Indexing & B/B+ Trees',
        items: [
          _FormulaItem(name: 'Primary Index', formula: '''Ordered file, index on Key field.''', explanation: 'Sparse index.'),
          _FormulaItem(name: 'Clustering Index', formula: '''Ordered file, index on Non-Key field.''', explanation: 'Sparse index.'),
          _FormulaItem(name: 'Secondary Index', formula: '''Unordered file, index on Key/Non-Key.''', explanation: 'Dense index.'),
          _FormulaItem(name: 'B-Tree Node Capacity', formula: '''Order m: Each internal node has at most m children, min ceil(m/2) children.''', explanation: 'Balanced search tree.'),
          _FormulaItem(name: 'B+ Tree Structure', formula: '''Data pointers only in leaf nodes.\\nInternal nodes only have search keys.''', explanation: 'Higher fan-out, faster search.'),
        ]
      )
    ]);
  }
"""

if "_buildCSITDSATab(BuildContext context)" not in content:
    # insert before the last closing brace
    last_brace_idx = content.rfind("}")
    if last_brace_idx != -1:
        # Find the class ending brace.
        # Actually, formula_sheet_screen.dart has other classes at the end: _FormulaItem and _FormulaCard.
        # So we should insert it before `class _FormulaCard extends StatelessWidget {`
        class_idx = content.rfind("class _FormulaItem")
        if class_idx != -1:
            content = content[:class_idx] + methods + "\n\n" + content[class_idx:]

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)

print("Injected missing methods and escaped $")
