<!--
Add here global page variables to use throughout your website.
-->
+++
author = "Nishar Arjyal"
mintoclevel = 2

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/", "franklin", "franklin.pub"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Nishar Arjyal's Blog"
website_descr = "This is where I explain things that I am interested in."
website_url   = "https://nishararjyal.github.io/"
+++

<!--
Add here global latex commands to use throughout your pages.
-->

\newcommand{\R}{\mathbb R}
\newcommand{\N}{\mathbb N}
\newcommand{\Z}{\mathbb Z}
\newcommand{\rationals}{\mathbb Q}
\newcommand{\powerset}{\mathscr{P}}

\newcommand{\equivcls}[1]{%
  #1\!/\!{\sim}%
}

\newcommand{\scal}[1]{\langle #1 \rangle}
\newcommand{\lineskip}{@@blank@@}
\newcommand{\skipline}{\lineskip}
\newcommand{\note}[1]{@@note @@title ⚠ Note@@ @@content #1 @@ @@}
\newcommand{\warn}[1]{@@warning @@title ⚠ Warning!@@ @@content #1 @@ @@}
\newcommand{\theorem}[1]{@@theorem @@title Theorem:@@ @@content #1 @@ @@}
\newcommand{\lemma}[1]{@@lemma @@title Lemma:@@ @@content #1 @@ @@}
\newcommand{\remark}[1]{@@remark @@title Remark:@@ @@content #1 @@ @@}
\newcommand{\axioms}[1]{@@axiom @@title Axioms:@@ @@content #1 @@ @@}
\newcommand{\properties}[1]{@@axiom @@title Properties:@@ @@content #1 @@ @@}
\newcommand{\example}[1]{@@example @@title Example:@@ @@content #1 @@ @@}
\newcommand{\proof}[1]{@@proof @@title Proof:@@ @@content #1 @@ @@}
\newcommand{\definition}[1]{@@definition @@title Definition:@@ @@content #1 @@ @@}
