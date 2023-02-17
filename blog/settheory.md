@def title = "Set Theory"
@def published = "17 February 2022"
@def tags = ["math", "set_theory"]


# Set Theory

\toc 

## Preface: 

I have been learning axiomatic set theory lately and would like to use this 
blog as a way to document the notes as I learn them. If you are not a student of mathematics who somehow stumbled upon this post for learning just the basic amount of set theory for learning other subjects in applied mathematics then you shouldn't fret. Although this document is not about naive set theory, we will develop and mention all the ideas of set theory you may need in as simple a way as possible. If you are a mathematics student, then you can use this post as some kind of lecture notes if you ever attended lectures. 

## Basic Definitions:

We will separate the notion of *classes* and sets. All objects are classes and 
those classes that can be contained in other classes will be referred to as 
_elements_ or *sets*. We will consider the $\in$ to be a binary, the membership relation along with the $=$ the equality predicate. We are now ready to make our first definition that will use formal 
notation.

\definition{
__A=B__: Two classes $A$ and $B$ are said to be equal if every class that has $A$ as an element also has the class $B$ as an element and vice versa.

$$(A = B) \iff (\forall X)[A\in X \iff B\in X] \label{dequality}$$
}

We will also make the following definition for subsets. 

\definition{
__$A\subseteq B$__: $A$ is said to be a subset of $B$ if every element of $A$ is also an element of $B$.

$$A\subseteq B \iff \forall t[t\in A \implies t \in B] \label{dsubset}$$

}

## ZFC Axioms:

So, we will begin by mentioning the axioms of Zermelo and Fraenkel as mentioned in common textbooks on set theory like \cite{jech03, enderton77}.


\axioms{

1. __Axiom of Extensionality__: If $A$ and $B$ have the same elements, then they are equal. 
$$
\forall A \forall B [\forall x (x\in A \iff x \in B) \implies A = B]
\label{extensionality1}
$$

or alternatively 

$$
\forall A \forall B [\forall x (x\in A \iff x\in B) \implies \forall X (A\in X \iff B \in X)]
\label{extensionality2}
$$

2. __Axiom of Empty Set__: There exists a set having no elements.

$$
\exists A (\forall x, x\notin A)
\label{emptyset}
$$

3. __Axiom of Pairing:__ For any $A$ and $B$, there exists a set that contains exactly $A$ and $B$.

$$
\forall A \forall B \exists C [\forall x (x \in C \iff x = A \lor x = B)]
\label{pairing}
$$

4. __Axiom of Power Set__: For any set A, there exists a set whose elements are exactly the subsets of $A$.

$$
\forall A \exists B \forall x (x\subseteq A \iff x\in B)
\label{powerset}
$$

5. __Axiom Schema of Separation__: Let $\varphi$ be any formula with all free variables among $x, c, t_{1}, \dots, t_{n}$ ($B$ is not free in $\varphi$). Then, 

$$
\forall t_{1}\forall t_{2}\dots\forall t_{n}\forall c \exists B \forall x[x\in B \iff (x\in c) \land \varphi(x,c, t_{1}, \dots, t_{n})]
\label{separationschema}
$$

6. __Axiom of Union__: For any $A$, there exists a set whose elements are exactly the members of members of $A$.

$$
\forall A \exists B \forall x [x\in B \iff (\exists a\in A) x\in a]
\label{union}
$$

7. __Axiom of Infinity__: There exists an *infinite* set.

8. __Axiom of Replacement:__

9. __Axiom of Regularity__:

10. __Axiom of Choice__:

}

The axioms $A-1 \text{ to } A-9$ are the $ZF$ axioms which becomes $ZFC$ with the addition of the axiom $A-10$(**AC**).

## Bibliography: 

* \biblabel{jech03}{Jech (2003)} **Thomas Jech**, [Set Theory](https://link.springer.com/book/10.1007/3-540-44761-X), Springer 2003.

* \biblabel{enderton77}{Enderton (1977)} **Herbert B. Enderton**, [Elements of Set Theory](https://www.amazon.com/Elements-Set-Theory-Herbert-Enderton/dp/0122384407), Academic Press 1977.




