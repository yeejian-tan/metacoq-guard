Definition shf := nat.
Definition var := nat.

(* Basically [A + var]. *)
Inductive or_var (A : Type) : Type := 
| Arg : A -> or_var A
| Var : var -> or_var A.

(* 
Tree whose nodes are annotated with a shift factor [shf] and a [or_var A].
Non-leaf nodes have, in addition, two children 
and a final argument [shf] that "cache"s the sum of shifts in the subtree.
*)
Inductive tree (A : Type) : Type :=
| Leaf : shf -> or_var A -> tree A
| Node : shf -> or_var A -> tree A -> tree A -> shf -> tree A.

Inductive subs (A : Type) : Type :=
| Nil : shf -> var -> subs A
| Cons : var -> tree A -> subs A.
