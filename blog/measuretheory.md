@def title = "Measure Theory"
@def published = "19 February 2022"
@def tags = ["math", "measure_theory", "real_analysis"]


# Measure Theory

\toc 

## Preface
Basically, the people in the [maths discord](https://discord.gg/math) have announced 
a measure theory reading group that meets every Saturdays. I have been wanting to learn 
measure theory for a while and I see this as a perfect opportunity to finally start learning 
it given that it is enormously helpful having other people studying it together with you trying 
to cover a chapter each week. So, consider this blog as a place for my notes as I 
study measure theory. As a reference, the group will primarily be using \cite{folland99} 
and so will I in these notes. If I use any other textbook, I will make sure to reference it later 
in this blog.


## Introduction
We want a mapping $\mu: \powerset(\R^{n}) \to [0,\infty]$ that takes subsets of $\R^{n}$, $n\in \N\backslash \{0\}$ to a 
non-negative real number (extended to $+\infty$). We call such a mapping the 
$n$-dimensional measure of $E\subseteq{\R}$ given as $\mu(E)\in [0,\infty]$. We 
want such a measure to satisfy the following few properties. 

\properties{

**P-1**. \label{P-1} If $E = \bigcup_{j\in \Z_{+}}E_{j}$ where $E_{i}\cap E_{j}=\phi$ for $i\neq j$
and each $E_{i}\subseteq \R^{n}$ then, 

$$\mu(E) = \mu(\bigcup_{j\in\Z_{+}}E_{j}) = \sum_{j=1}^{\infty}\mu(E_{j})$$

**P-2**.\label{P-2} If $E$ is congruent to $F$, i.e., $E$ can be transformed to $F$ 
by translations, rotations, and reflections, then 

$$\mu(E) = \mu(F)$$

**P-3**. \label{P-3} The measure of the unit cube is 1.

$$ \mu(Q) = 1$$ 

where $Q = \{x\in \R^{n} \mid 0\leq x_{j} < 1~\forall~j\in \{1,2,\dots, n\}\}$


}

It turns out that the three properties [P-1](#p-1), [P-2](#p-1) and [P-3](#p-3) are mutually inconsistent. 

\theorem{
\label{nosuchmeasure}
There is no such map $\mu: \powerset(\R) \to [0,\infty]$ that satisfies all 
[P-1](#p-1), [P-2](#p-2) and [P-3](#p-3)
}

\proof{

\label{proofnosuchmeasuare}
Define a relation $\sim$ on $[0,1)$ as $x\sim y \iff x-y\in \rationals$. Clearly, $\sim$ 
is an equivalence relation.
Consider $\Lambda = \equivcls{[0,1)}$ the set of all equivalence classes of 
$[0,1)$ under the equivalence relation $\sim$. <!-- $\Lambda$ is not countable.  -->

Let us invoke the [Axiom of Choice](/blog/settheory/index.html#aoc) on $\Lambda$ to pick
from each equivalence class in $\Lambda$ precisely one member and call this set 
$N$ such that $N\subseteq [0,1)$.

Now, let $R = \rationals \cap [0,1)$. For each $r \in R$, let 

$$N_{r} = \{y+r\mid y\in N \cap [0,1-r)\} \cup \{y+r-1 \mid y\in N\cap [1-r, 1)\}.$$

$N_{r}$ is just every element of $N$ shifted to the right by rational $r$ units
and the part that sticks out beyond $[0,1)$ is shifted back one unit to the left.

Then, each $N_{r}\subseteq [0,1)$. Now, consider any $x\in [0,1)$. 
Suppose $y\in N$ such that $y\in [x]$, then $x\in N_{r}$ where $r = x-y$ if $x\geq y$ 
or $r = x-y+1$ if $x < y$. If $x\in N_{r}\cap N_{s}$ then, $x-r$ or ($x-r+1$) and 
$x-s$ or ($x-s+1$) are two distinct elements of $N$ that are in the same 
equivalence class which is impossible. 

From [P-1](#p-1) and [P-2](#p-2), 

$$ \mu(N) = \mu(N\cap [0,1-r)) + \mu(N\cap [1-r, 1)) = \mu(N_{r})$$

Since $[0,1)$ is the disjoint union of $N_{r}$ and $R$ is countable

$\mu([0,1)) = \sum_{r\in R}\mu(N_{r})$

From [P-3](#p-3), $\mu([0,1)) = 1$ and since $\mu(N_{r}) = \mu(N)$, 
the sum on the right is either $0$ if $\mu(N) = 0$ or $\infty$ if $\mu(N)>0$.
So, the left and the right can never be equal. So, no such $\mu$ can exist.

}  <!-- proof -->

So, what if we weaken the condition/property [P-1](#p-1)? 
Let's say that the additivity holds only for finite sequences of subsets of $\R^{n}$. 
This is a bad thing to do because for analysis, having countability is too important. 
\\
\\
For dimensions $n\geq 3$, there exists this thing called the [Banach-Tarski Paradox](https://en.wikipedia.org/wiki/Banach%E2%80%93Tarski_paradox)
whose result is that one can take a ball of the size of a pea, separate it to 
finite number of pieces and rearrange them to get a ball the size of the sun.
\\
\\
This prevents the construction of any map as we described above even for the 
restricted finite sequence additivity case that assigns postive, finite 
values for bounded open sets.
\\
\\
This means that $\R^{n}$ has subsets that can't be measured (no sensible measure
can be defined for them). So, we will only define the measure for certain "nice" 
subsets of $\R^{n}$.

## Sigma algebras

\definition{
\label{algebradefn}
  Let $X$ be a nonempty set. An *algebra* of sets on $X$ is a nonempty collection $\niceA$ of subsets of $X$ that is closed under finite unions and complements. That is, $E_{1}\dots E_{n} \in \niceA \implies \bigcup_{j}E_{j}\in \niceA$ and $E\in \niceA \implies X\backslash E \in \niceA.$
}

\definition{
\label{sigmaalgebradefn}
  A $\sigma$-*algebra* is an algebra that is closed under countable unions. It is also called a $\sigma$-*field*.
}

\proposition{
Algebras are closed under finite intersections. 
}

\proof{
\label{finiteintersection}
  Let $\niceA$ be an algebra on $X$. Consider $E_{1},\dots, E_{n} \in \niceA$. Then, for any $j\in \{1,\dots,n\},$ $E_{j} \in \niceA \implies X\backslash E_{j}\in \niceA$. Then, $\bigcup_{j}(X\backslash E_{j})\in \niceA$. This implies that $X\backslash \bigcup_{j}(X\backslash E_{j})\in \niceA.$ 
  By De-Morgan's law, $\bigcap_{j}E_{j} = X\backslash \bigcup_{j}(X\backslash E_{j}) \in \niceA$
}

\proposition{
  $\sigma$-*algebras* are closed under countable intersections.
}

\proof{
  Similar proof as the [previous](#finiteintersection) one can be applied as De-Morgan's laws apply for countable collections.
}

\proposition{
  Let $X$ be a nonempty set. Let $\niceA$ be a $\sigma-algebra$ on $X$. Then, $\phi\in \niceA$ and $X \in \niceA$.
}

\proof{
  Let $E\in \niceA$. This implies, $X\backslash E \in \niceA \implies [X = E\cup (X\backslash E) \in \niceA].$
  Also, $\phi = E\cap (X\backslash E)\in \niceA.$
}

\definition{
  A pair $(X,\niceA)$ consisting of a set $X$ and a $\sigma$-algebra $\niceA$ of subsets of $X$ 
  is called a __measurable space__.
}

\proposition{
  If an algebra $\niceA$ on $X$ is closed under countable disjoint unions then it is a $\sigma$-algebra.
}

\proof{
  $\niceA$ is an algebra so it is closed under complementation.

  Suppose $\{E_{j}\}_{j=1}^{\infty}\subseteq \niceA$. Set 

  $$
  F_{k} = E_{k} \backslash \bigcup_{j=1}^{n-1}E_{j} = E_{k} \cap (X\backslash \bigcup_{j=1}^{n-1}E_{j})
  $$

  Clearly, $F_{k} \in \niceA$ for all $k\geq 1$ and the $F_{k}$s are disjoint. Notice $\bigcup_{k=1}^{\infty}F_{k} = \bigcup_{j=1}^{\infty} E_{j}$
  So, $\niceA$ is also closed under countable unions. Hence, $\niceA$ is a $\sigma$-algebra.
}

\example{
 \label{powersetissigma} 
  If $X$ is any set, $\powerset(X)$ and $(X,\phi)$ are sigma algebras on $X$.

  The $\powerset(X)$ is set of _all_ subsets of $X$ so it is clearly a sigma algebra. 

  Clearly ($X,\phi$) is closed under complementation and union.
}

\theorem{
  If $X$ is uncountable, then 

  $$\niceA = \{E\subseteq X \mid E \text{ is countable or } X\backslash E \text{ is countable }\}$$

  is a $\sigma$-algebra. 

  This $\sigma-algebra$ is called the __$\sigma$-algebra of countable or co-countable sets__.
}

\proof{
   Observe, $E\in \niceA \iff E \text{ countable or } X\backslash E \text{ countable }$
   $\iff X\backslash E \text{ countable } \lor E \text{ countable }$
   $\iff X\backslash E~countable~\lor X\backslash (X\backslash E)~countable~$
   $\iff X\backslash E \in \niceA.$

   So $\niceA$ is closed under complementation.

  Spse $\{E_{j}\}_{j\geq 1}\containedin \niceA$. 

  If all $E_{j}$ are countable then clearly $\bigcup_{j\geq 1}E_{j}$ is countable and is in $\niceA$.

  Now, suppose for some $j\prime \geq 1, E_{j'}$ is co-countable.

  Then notice 

  $$
  X\backslash \bigcup_{j\geq 1}E_{j} = \bigcap_{j\geq 1}(X\backslash E_{j}) \subseteq X\backslash E_{j\prime}
  $$

  Since, $X\backslash E_{j\prime}$ is countable, $X\backslash \bigcup_{j\geq 1}E_{j}$ is countable and hence, 

  $\bigcup_{j\geq 1}E_{j}$ is co-countable.

  Hence, $\niceA$ is closed under countable unions.
}

\definition{
Let $X$ be a set and $\niceF\containedin \powerset(X)$. The, the __smallest $\sigma$-algebra__ of subsets of $X$ 
containing $\niceF$ is called the __$\sigma$-algebra generated by $\niceF$__ and is denoted by $\sigma(\niceF).$
}

\proposition{
  Let $X$ be a set. For any family $\niceF \containedin \powerset(X)$ there exists a unique $\sigma$-algebra generated 
  by $\niceF$.
}

\proof{
  Existence of a $\sigma-$algebra containing $\niceF$ follows from the existence of $\powerset(X)$ and [an earlier example](#powersetissigma).

  Now, set $\sigma(\niceF) = \bigcap\{A\mid (\niceF\containedin A) \land A \text{ is a sigma algera on } X\}$ 

  By construction $\niceF\containedin \sigma(\niceF)$. Take any $\{A_{j}\}_{j\geq 1}\containedin \sigma(\niceF)$.
  Then, each $A_{j}$ belongs to every $\sigma$-algebra of $X$ that contains $\niceF$. So, their complements and 
  countable intersections, thereby countable unions belongs to any $\sigma$-algebra of $X$ that contains $\niceF$. Hence, $\sigma(\niceF)$ is a 
  $\sigma$-algbera. 

  Uniqueness follows from the fact that existence of a $\sigma$-algebra $\mathcal{B}$ that contains $\niceF$ but not $\sigma(\niceF)$ contradicts the 
  definition of $\sigma(\niceF)$ since $\mathcal{B}\cap \sigma(\niceF)$ contains $\niceF$ and is a $\sigma$-algebra.
}

Notice that the family of intervals with rational endpoints is countable. However, also notice that this 
family generates a $\sigma$-algebra that contains all single-point sets. 

Why? well the Borel $\sigma$-algebra contains all singletons and every open 
set can be written as a countable union of intervals with rational endpoints and similar arguments one can show this.

This means that a countable family of subsets of $X$ can generate a $\sigma$-algebra that is 
uncountable.


<!-- Notice that the class of sets formed by the complements of sets in the family $\niceF\containedin \powerset(X)$  -->
<!-- generates the same $\sigma$-algebra as $\niceF$. Also, notice that countable family  -->
<!-- of sets may generate an uncountable $\sigma$-algebra. For example, the intervals with rational  -->
<!-- endpoints generate the $\sigma$-algebra containing all single-point sets. -->

\lemma{
If $\mathcal{E}\containedin \sigma(\niceF)$ then $\sigma(\mathcal{E})\containedin \sigma(\niceF)$.
}

Since, $\sigma(\niceF)$ is a $\sigma$-algebra containing $\mathcal{E}$; it must contain $\sigma(\mathcal{E})$.
\\
\\
The $\sigma$-algebra generated by the class $\niceF$ can not be described in a constructive 
form by means of countable unions, intersections or complements of elements of $\niceF$.
This is because these operations can be repeated unlimited number of times and we can 
obtain new classes all the time, but their union does not exhaust the $\sigma$-algebra generated by $\niceF$.
\\
\\
The following is an example where one can explicitly describe the $\sigma$-algebra generated by a class of sets.

\example{
Let $\niceA_{0}$ be a $\sigma$-algebra on a space $X$. Suppose $S\subseteq X$ and $S\notin \niceA_{0}$. Then, the $\sigma$-algebra 
$\sigma(\niceA_{0}\cup \{S\})$, generated by $\niceA_{0}$ and the set $S$ coincides with the collection 
of all sets of the form 

$$
E = (A\cap S) \cup (B\cap (X\backslash S))
$$
}

\proof{

Consider $\niceF = \{E \mid E = (A\cap S) \cup (B\cap X\backslash S)\, A,B\in \niceA_{0}\}$ 

}






## Bibliography

* \biblabel{folland99}{Folland (1999)} **G. B. Folland**, [Real analysis: modern techniques and their applications](https://www.amazon.com/Real-Analysis-Techniques-Applications-Mathematics-ebook/dp/B00J4B73D8), 2nd ed. New York: Wiley, 1999.
