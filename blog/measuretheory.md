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

$$N_{r} = \{x+r\mid x\in N \cap [0,1-r)\} \cup \{x+r-1 \mid x\in N\cap [1-r, 1)\}.$$

$N_{r}$ is just every element of $N$ shifted to the right by rational $r$ units
and the part that sticks out beyond $[0,1)$ is shifted back one unit to the left.


}


<!--this is how you reference labels in franklin [hi](#p-1) for some label \label{P-1}, always write small-->





## Bibliography

* \biblabel{folland99}{Folland (1999)} **G. B. Folland**, [Real analysis: modern techniques and their applications](https://www.amazon.com/Real-Analysis-Techniques-Applications-Mathematics-ebook/dp/B00J4B73D8), 2nd ed. New York: Wiley, 1999.
