// ── Configuration ──────────────────────────────────────────
#let course = ""
#let assignment = "Chapter 1"
#let author = "H Chan"
#let label-prefix = "8"

// ── Page & text setup ──────────────────────────────────────
#set page(margin: 1in)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)
#set math.equation(numbering: "(1)")

// ── Heading styles ─────────────────────────────────────────
#show heading.where(level: 1): it => {
  text(size: 12pt, weight: "bold")[Problem #label-prefix.#it.body.]
}
#show heading.where(level: 2): it => {
  text(weight: "bold", style: "italic")[#it.body.]
}

// ── Theorem-like environments (no background boxes) ────────
#let remark(body) = [_Remark._ #body]

#let proof(body) = align(center, block(above: 2em, below: 2em)[
  #rect(width: 90%, outset: 7pt, fill: silver)[
    #set align(left)
    #set par(first-line-indent: 1em)
    *_Proof._* \
    #h(1em)
    #body
  ]
])

// Old proof box
// #rect(stroke:gray, fill:rgb("#f6f6f6"))[
// _Proof._ \
// #h(1em) ]


// ── Title ──────────────────────────────────────────────────
#align(center)[
  #text(size: 16pt, weight: "bold")[#course #assignment]

  #text(size: 12pt)[#author]
]
#v(1em)

// ════════════════════════════════════════════════════════════
//  PROBLEMS
// ════════════════════════════════════════════════════════════

= 1

Show that an inverse limit of nonempty finite discrete sets (for any directed index set) is nonempty. [_Hint:_ For such an inverse system ${X_alpha : alpha in Lambda}$, consider the subsets $X_(lambda mu) subset.eq product X_alpha$ consisting of the sequences $(x_alpha)$ satisfying $phi.alt_(lambda mu) (x_mu) = x_lambda$ for a fixed pair $lambda lt.eq mu$ and use the compactness of the topological product of the $X_alpha$. We shall go through this argument in a more general case in Lemma 3.4.12.]


#proof[Let ${X_alpha : alpha in Lambda}$ denote such an inverse system, and let $X_(lambda mu) subset.eq product X_alpha$ be the set of sequences $(x_alpha)$ with $phi.alt_(lambda mu) (x_mu) = x_lambda$ for some $lambda lt.eq mu$. This is a closed set, as its complement admits the open cover $product_(alpha != lambda, mu) X_alpha times {x_mu} times (X_lambda without {x_lambda})$. We deduce that $X_(lambda mu)$ is itself a compact space as a closed subset of a compact space.

On the other hand, by the compatibility condition of inverse systems, the collection of all such $X_(lambda mu)$'s must then satisfy the finite intersection property. Hence the intersection of all the $X_(lambda mu)$'s must be nonempty. But then this is exactly the inverse limit of the system. $qed$]

= 2

Let $G$ be a profinite group, $p$ a prime number. A *pro-$p$-Sylow subgroup* of $G$ is a pro-$p$-group whose image in each finite quotient of $G$ is of index prime to $p$. Show that pro-$p$-Sylow subgroups exist and they are conjugate in $G$. [_Hint:_ Apply the previous exercise to the inverse system formed by the sets of $p$-Sylow subgroups in each finite quotient of $G$.]

#proof[Consider the directed system of finite quotients of $G$. Every finite quotient has finitely many Sylow $p$-subgroups, the collection of which is a finite set that we can endow with the discrete topology. By the correspondence theorem, pullbacks of Sylow $p$-subgroups satisfy the cocycle condition, such that this gives an induced directed system of sets of Sylow $p$-subgroups in each finite quotient of $G$. But then by the result of the previous question, the inverse limit of this set is nonempty. But then every Sylow $p$-subgroup of a finite quotient of $G$ corresponds to a subgroup of $G$, such that the inverse limit of the system of Sylow $p$-subgroups corresponds to an inverse limit of a system of subgroups of $G$. Hence the result is indeed a well-defined pro-$p$-Sylow subgroup of $G$.

Now, suppose that we have two such pro-p-Sylow subgroups $P_1,P_2$. They are conjugate in each finite quotient of $G$, such that the quotient of a conjugating element is still a conjugating element. Hence we obtain another inverse system of conjugating elements in $G$, which is nonempty and corresponds to an element of $G$ that carries $P_1$ to $P_2$ by the same reasoning. $qed$]



#pagebreak()

= 3

Let $k$ be a perfect field, $p$ a prime number. Show that there exists an algebraic extension $k^((p)) | k$ such that each finite subextension is of degree prime to $p$ and $k^((p))$ has no nontrivial finite extensions of degree prime to $p$. Is such an extension unique inside a fixed algebraic closure? [_Hint:_ Use the previous exercise.]

#proof[As $k$ is a perfect field, $overline(k)=k^"sep"$. Denote the absolute Galois group by $G$. If $K$ is some finite degree $p$-coprime extension of $k$, let $L$ be the normal closure of $K$ in $overline(k)$ such that we get a finite quotient $G arrow.twohead "Gal"(L\/k)$. Then $K$ corresponds to a Sylow $p$-subgroup of $"Gal"(L\/k)$. In other words, the inverse system of finite $p$-coprime extensions of $k$ corresponds to the inverse system of Sylow $p$-subgroups in finite quotients of $G$. Hence by the previous result this induces a well-defined pro-$p$-Sylow subgroup that corresponds to a maximal $p$-coprime extension $k^((p))$ of $k$ by the fundamental theorem of Galois theory. In particular, as pro-$p$-Sylow subgroups are only unique up to conjugation, $k^((p))$ will only be unique up to Galois conjugation. $qed$]

= 4

Consider the compositum $E$ of all quadratic extensions of $QQ$ inside a fixed algebraic closure $overline(QQ)$.

*(a)* Show that $"Gal"(E|QQ)$ is uncountable and has uncountably many subgroups of index 2.

#proof[Let $T = {-1} union {"primes"}$, such that then $E$ is generated over $QQ$ by ${sqrt(t) : t in T}$, and the extensions ${QQ(sqrt(t))}$ are linearly disjoint over $QQ$. Every $sigma in op("Gal")(E slash QQ)$ is therefore uniquely determined by the signs $sigma(sqrt(t)) = plus.minus sqrt(t)$ for every $t in T$. Hence $"Gal"(E slash QQ) tilde.eq product_(t in T) ZZ slash 2 ZZ tilde.eq (ZZ slash 2 ZZ)^(aleph_0)$, which has cardinality $2^(aleph_0)$ and is uncountable. Moreover, as the infinite product of abelian groups is abelian, it immediately follows that the group admits uncountably many quotients into $ZZ\/2ZZ$; i.e. has uncountably many subgroups of index $2$. $qed$]

*(b)* Deduce that there are uncountably many subgroups of index 2 in $"Gal"(overline(QQ)|QQ)$ that are not open.

#proof[All degree $2$ extensions of $QQ$ are necessarily primitive and Galois. Hence we can write $E=QQ(alpha)$ for some $alpha$, such that the extension is entirely determined by the minimal polynomial of $alpha$. Hence we get a surjection from the set of degree $2$ irreducible polynomials in $QQ[x]$ to the set of quadratic extensions of $QQ$. So both sets must be countable. By the pigeonhole principle, and by the result of (a), this implies that are uncountably many subgroups of index 2 in $"Gal"(overline(QQ)|QQ)$ that do not correspond to intermediate fields; i.e. are not open (as a closed finite index subgroup is open - Lemma 1.3.8.). $qed$]

#pagebreak()

= 5

Let $G$ be a profinite group acting via field automorphisms on a field $K$. Assume that the action is continuous when $K$ carries the discrete topology and that each nontrivial element in $G$ acts nontrivially on $K$. Show that $G tilde.equiv "Gal"(K|k)$, where $k = K^G$.

#proof[As $G$ acts via $k$-fixed field automorphisms of $K$, there is a well-defined map $G arrow.hook "Aut"(K \/ k)$. The fact that each nontrivial element in $G$ acts nontrivially on $K$ guarantees that this map is an embedding. Moreover note that $"Fix"("Aut"(K\/k)) subset.eq "Fix"(G) = k$, so by Definition 1.2.1. _($L\/k$ is Galois iff $italic("Fix(Aut("L\/k"))" =k)$)_ $K\/k$ is indeed Galois.

Next, as $K$ is assumed to carry the discrete topology, the action being continuous is equivalent to the stabilizers $G_x$ of every point $x in K$ being open in $G$ (see p.20). This implies that the embedding $G arrow.hook "Gal"(K \/ k)$ is in fact a continuous map: Open sets in $limits(lim)_(arrow.l.long) "Gal"(L\/k) tilde.equiv "Gal"(K\/k)$ are of the form $U = {sigma : sigma #h(-0em) |_L subset.eq U_L}$, where $U_L subset.eq "Gal"(L\/k)$ is some arbitrary subset and $L$ is finite degree. By the primitive element theorem, $L = k(alpha)$ for some $alpha$. Then elements of $U_L$ correspond bijectively to elements of the orbits of $alpha$; such that $U$ is equal to the finite union of the stabilizers of those elements; and its preimamge in $G$ is open.

Finally notice that $G$ and $"Gal"(K\/k)$ are both compact Hausdorff groups; such that the image of $G$ in $"Gal"(K\/k)$ is necessarily closed. To complete the proof; notice that by the fundamental theorem of Galois theory we get that $G$ is the unique closed subgroup of $"Gal"(K\/k)$ that fixes $k$; i.e. $"Gal"(K\/k)$ itself. So the map is a group isomorphism. The map is also a homeomorphism, as it is a bijective continuous map between compact Hausdorff spaces. $qed$]


#pagebreak()

= 6

_(Leptin, Waterhouse)_ Show that every profinite group $G$ arises as the Galois group of some Galois extension $K|k$. [_Hint:_ For each open normal subgroup $N lt.closed G$ fix a system of left coset representatives $1 = sigma_1^N, dots, sigma_m^N$. Let $F$ be a perfect field, and $K|F$ the purely transcendental extension obtained by adjoining an indeterminate $x_i^N$ for each $sigma_i^N$. Make $G$ act on $F$ trivially, and on $K$ via $sigma(x_i^N) = x_j^N$, where $x_j^N$ corresponds to $sigma_j^N$ with $sigma_j^N N = sigma(sigma_i^N N)$. Verify that this action satisfies the criterion of the previous exercise.]

#remark[The statement does not hold if one requires $K$ to be a separable closure of $k$. For instance, Artin and Schreier showed in \[3\] that among the nontrivial finite groups only $ZZ\/2ZZ$ can arise as an absolute Galois group.]

#proof[That the action is well-defined follows from construction. We show via an application of Problem 8.5 that $G$ is isomorphic to $"Gal"(K\/K^G)$ as topological groups.

The action is continuous: By the same reasoning as in Problem 8.5, this is equivalent to showing that $G_x$ is open for all $x in K$. $x$ is then necessarily a rational function in finitely many of the $x_i^N$'s, so there exists finitely many open normal subgroups $N_1, ... , N_n$ such that $x in F(x_1^N_1, ..., x_m^N_1, ..., x_1^N_n, ... x_m^N_n)$. Then $G_x$ contains the open (normal) subgroup $inter.big N_i$; such that $G_x$ is itself necessarily normal as it is a union of the cosets of $inter.big N_i$.

The action is faithful: This amounts to showing that the only element in $G$ that is trivial in $G\/N$ for each open normal subgroup $N$ is the identity. To that end we show that such an element $g$ is necessarily contained in every neighbourhood of the identity; and as the topology on profinite groups is Hausdorff we will be done. By (p.12) we have that the kernels of the projections $G arrow G_i$ form an open neighbourhood basis of the identity. But then $g$ necessarily is in the same neighbourhood of $1$ for every element of this basis. $qed$]

#pagebreak()

= 7

Let $k$ be a field, and $A$ a finite étale $k$-algebra equipped with an action of a finite group $G$ via $k$-algebra automorphisms; we call such algebras _$G$-algebras_. We moreover say that $A$ is _Galois_ with group $G$ if $dim_k (A)$ equals the order of $G$ and $A^G = k$.

*(a)* Consider the $G$-algebra structure on $A times.o_k overline(k)$ given by $g(a times.o alpha) = g(a) times.o alpha$. Prove that $A$ is Galois with group $G$ if and only if $A times.o_k overline(k)$ is isomorphic to the group algebra $overline(k)[G]$ as a $G$-algebra.

#proof[For the following proof, we write $overline(k)^(|G|)$ instead of $overline(k)[G]$ to avoid notational confusion.

$(arrow.l.double):$ Suppose that $A times.o_k overline(k) tilde.equiv overline(k)^(|G|)$. As the dimension of a vector space remains unchanged under extension of scalars, we have that $dim_k A = dim_overline(k) A times.o_k overline(k) = dim_overline(k) overline(k)^(|G|) = |G|$ (this argument only needs the isomorphism as $k$-algebras).

Now, as the action of $G$ on $A times.o_k overline(k)$ is defined to be $g(a times.o alpha) = g(a) times.o alpha$, we have that $A^G times.o_k overline(k) = (A times.o_k overline(k))^G = (overline(k)^(|G|))^G = overline(k)$ (this argument requires the isomorphism to be $G$-equivariant as well!). By the same reasoning as above we have that $dim_k A^G = dim_overline(k) A^G times.o_k overline(k) = 1$; so $A^G = k$. $A$ is indeed $G$-Galois.

$(=>):$ Suppose that $A$ is $G$-Galois. Notice that the $k$-linear $G$-action on $A$ induces an $overline(k)$-linear $G$-action on $A times.o_k overline(k)$; as $g dot (a times.o alpha) = g(a) times.o alpha = alpha (g dot a times.o 1)$. But then $A times.o_k overline(k)$ is isomorphic to $overline(k)^(dim_k A) = overline(k)^(|G|)$ as $G$-algebras; where the $G$-action on $overline(k)^(|G|)$ is induced via the map. We are hence reduced to finding the $overline(k)$-algebra automorphisms of $overline(k)^(|G|)$.

We show that these are exactly given by the permutations of the coordinates: Let $phi.alt$ be such an automorphism, and let $I$ denote an index set for the basis vectors. Then for all $i in I$, we have  $phi.alt(e_i)^2 = phi.alt(e_i)$ such that $phi.alt(e_i) = sum_(j in J) e_j$ for some $J subset I$. But then the $phi.alt(e_i)$'s must also be pairwise orthogonal so they must have disjoint support; hence $phi.alt(e_i) = e_j$ for some $j$. 

We now show that $G$ acts (simply) transitively on $I$. Note that $|G| = |I|$ so simple transitivity and transitivity are equivalent. To that end, notice that $A^G = k$ implies $(A times.o_k overline(k))^G = overline(k)$, which is one dimensional; such that the only nontrivial $G$-invariant subspace is exactly given by the span of the vector $sum e_i$. But then $G$ can only have one orbit on $I$, as there would otherwise be another nontrivial invariant subspace. Hence $I$ is isomorphic to $G$ as left $G$-sets; and $A times.o_k overline(k)$ is isomorphic to $overline(k)^(|G|)$ as $G$-algebras. $qed$
]

#pagebreak()
*(b)* Making $G$ act on $"Hom"_k (A, k_s)$ via $phi.alt mapsto phi.alt compose g$, show that in the correspondence of Theorem 1.5.4, Galois algebras with group $G$ correspond to finite continuous $"Gal"(k)$-sets with simply transitive $G$-action.

#proof[For the following proof, we write $overline(k)^(|G|)$ instead of $overline(k)[G]$ to avoid notational confusion.

As $A$ is already an étale algebra, the statement of Theorem 1.5.4. already gives us that $"Hom"_k (A,k_s)$ is a finite continuous $"Gal"(k)$-set. Hence we need only verify that the induced $G$-action is transitive.

Notice that $overline(k)$-algebra homomorphisms $A times.o_k overline(k) tilde.equiv overline(k)^(|G|) arrow overline(k)$ are given exactly by coordinate projection maps: The idempotents $e_i$ must be sent to $0$ or $1$ only; but the fact that $1 = sum e_i$ is sent to $1$ enforces that exactly one of the $e_i$'s is sent to $1$. Hence $G$ acts transitively on the set $"Hom"_(overline(k)-"alg")(A times.o_k overline(k), overline(k))$.

This implies that $G$ acts transitively on $"Hom"_k (A,k_s)$: as $k subset overline(k)$ is a field extension, extension of scalars induces a bijection on hom-sets; such that $"Hom"_k(A,k_s) = "Hom"_k (A,overline(k)) tilde.equiv "Hom"_overline(k) (A times.o_k overline(k), overline(k))$.

Note that the converse is true as well: if $A$ is étale such that $"Hom"_k (A, k_s)$ admits a transitive $G$-action then so does $"Hom"_overline(k) (A times.o_k overline(k), overline(k))$. But then $A times.o_k overline(k)$ is isomorphic to $overline(k)^(dim_k A)$ as $overline(k)$-algebras, such that by a similar argument in (a) one can show that the simple transitivity enforces that $A times.o_k overline(k) tilde.equiv overline(k)^(|G|)$ such that $A$ is $G$-Galois. $qed$]



#pagebreak()

= 8

Let $k$ be a field of characteristic different from 2, and $S$ a continuous left $"Gal"(k)$-set with $n$ elements. Consider the subset $Sigma(S) subset S^n$ consisting of $n$-tuples $(s_1, dots, s_n)$ with $s_i eq.not s_j$ for $i eq.not j$. It inherits a continuous left action of $"Gal"(k)$ from the product action on $S^n$, and it also has a natural action by the symmetric group $S_n$ via permutation of the components. Denote by $Delta(S)$ the quotient of $Sigma(S)$ by the action of the alternating group $A_n subset S_n$. It is a 2-element continuous left $"Gal"(k)$-set.

*(a)* Show that the finite étale $k$-algebra corresponding to $Delta(S)$ via Theorem 1.5.4 is isomorphic to $k times k$ if $"Gal"(k)$ acts on $Delta(S)$ by even permutations, and is a degree 2 field extension of $k$ otherwise.

#proof[Suppose that $"Gal"(k)$ acts by even permutations. Then the action has exactly two orbits, so the corresponding étale algebra is just a direct product of the stabilizers subfields of the two elements. But then notice that as each orbit is a one element set, the stabilizer is necessarily the entirety of $"Gal"(k)$. Under the fundamental theorem this corresponds to $k$; i.e. the action corresponds to $k plus.o k$.

Now suppose that the action of $"Gal"(k)$ has at least one odd permutations. Then the action has one orbit on the two-element set, so this $"Gal"(k)$-set is isomorphic to $"Hom"(L,k_s)$ for some finite separable extension $L$. This set must have size $2$, such that $L$ itself must be a degree $2$ field extension of $k$. $qed$]


*(b)* If $A$ is the finite étale $k$-algebra corresponding to $S$ via Theorem 1.5.4, denote the $k$-algebra of (a) by $Delta(A)$. Show that when $A tilde.equiv k[x]\/(f)$ for a polynomial $f$ without multiple roots, then $Delta(A) tilde.equiv k[x]\/(x^2 - d(f))$, where $d(f) in k$ is the Vandermonde determinant formed from the roots of $f$.


#remark[The $k$-algebra $Delta(A)$ is called the _discriminant_ of the finite étale $k$-algebra $A$. For a description of $Delta(A)$ in the general case, see \[45\], Proposition 18.24.]


#proof[For the following proof, we take the definition of the Vandermonde determinant to be $d(f) := product_(i < j) (alpha_i-alpha_j)$. I suspect the author of the question is actually referring to the discriminant $d(f)^2$, so keep track of the discrepancy in notation.

When $A tilde.equiv k[x]\/ (f)$ for some separable $f$, $A$ is a $deg f$-dimensional product of separable extension of $k$; and the action of $"Gal"(k)$ on $S$ is isomorphic to the action of $"Gal"(k)$ on the roots of $f$. But then the Vandermonde determinant is an alternating form; such that $sigma dot d(f) = "sgn"(sigma) d(f)$ for all permutations $sigma$. Hence $Delta(S)$ is isomorphic as $"Gal"(k)$-sets to the set ${d(f), -d(f)}$, which is indeed a $2$-element set as the characteristic is not $2$. But then the action of $"Gal"(k)$ is odd $<==>$ the action is transitive $<==>$ the $"Gal"(k)$-conjugates of $d(f)$ are $plus.minus d(f)$ $<==>$ $d(f)$ is not in $k$. So $k[x]\/(x^2 - d(f)^2)$ is a quadratic extension of $k$ iff $"Gal"(k)$ is odd, and is isomorphic to $k[x]\/(x+d(f))(x-d(f)) tilde.equiv k plus.o k$ otherwise. By (a) we are done. $qed$]