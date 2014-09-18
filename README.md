# Math club

The current aim of the math club is to discuss the paper by Kryazhimskiy and
Plotkin (2008): **The Population Genetics of dN/dS** (available
[here][Kryazhimskiy2008]). This paper addresses the validity of studying
evolutionary pressures on protein coding sequences by calculating the dN/dS
ratio for polymorphisms observed in a single species, since this ratio was
initially developed for the comparison of sequences across different species.

The paper is challenging from a theoretical point of view, since we do not have
the background needed to fully apprehend its content. After discussing
together, we agreed that it would make sense to try to obtain a good
understanding of the foundations first before we try to go further. A proposed
schedule is:

  1.  the Wright-Fisher model (neutral, with and without mutation or selection)
  2.  the dN/dS model for comparison of sequences between populations
  3.  a bit of coalescent theory?
  4.  deriving step by step the formulas in the paper



## First meeting

The first meeting should take place around 15-16th of May. The theme will be
the Wright-Fisher model. Roland agreed to make a (short?) presentation
concerning the model. The aim is that we are all able to derive the model from
the initial steps in order to understand it and to be able to modify it to our
needs. Once we are all at the same point for the theory, we can play around with it
using R.

For the very first meeting, the goal is to understand the neutral Wright-Fisher
model. This is the simplest form of the model, and once we are comfortable with
it we can then study how selection and mutation can be introduced in it.

It would be nice if everybody could have a pen and paper for the theoretical
part, and a laptop (or one laptop by pairs of people) for the playing with R
part. We could use [Etherpad][EtherpadWebsite] to share code between us.



## Reference material

The pdf of Kryazhimskiy and Plotkin can be accessed from the [PLoS
Genetics][Kryazhimskiy2008] website.

A great resource is the book [Theoretical Evolutionary Genetics][FelsensteinTEG] by
Joseph Felsenstein. The book is unfinished but the draft is available for
download.



## How to contribute to this repository

This is a Git repository. Git is a version control tool, the one which was
introduced during the seminars about reproducible research with R. It is a very
helpful tool for collaborative authoring and for keeping track of changes in a
project, but might be a bit intimidating at first. If you want to add something
to the repository but don't know how to do, ask me or Roland! But if you are
willing to try to use Git yourself (which is always a good move), you can
easily copy this repository:

  1. install [Git][GitWebsite] on your machine
  2. on a Windows machine: open a git bash window in the folder where you want
     to clone the repository. On a Linux machine: open a terminal and navigate
     to the desired folder.
  3. type: `git clone https://github.com/matthieu-bruneaux/math-club.git`

You now have a full copy of the repository with its history on your machine!
You can add material to it, commit the changes, and send a pull request to
update the on-line repository.

Here is a nice [crash course on using Git](https://help.github.com/articles/set-up-git),
and optionally in combination with Github.

If you have a GitHub account (which is free), you can be added as a
collaborator to the repository and you will have read/write access to it
(i.e. you can push changes without having to request it from me).

Note that you can also download each file or folder manually.

If this format is really not convenient, we can also change to something more
conventional like Dropbox.



<!-- Links -->

[Kryazhimskiy2008]: http://www.plosgenetics.org/article/info:doi/10.1371/journal.pgen.1000304
[EtherpadWebsite]: http://etherpad.org/
[FelsensteinTEG]: http://evolution.genetics.washington.edu/pgbook/pgbook.html
[GitWebsite]: http://git-scm.com/
