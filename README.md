# Example using pandoc.

This example is based on Thomas Mailund's nice
[pamphlet](https://www.amazon.com/Beginners-Guide-Markdown-Pandoc-ebook/dp/B06XYPLZC1) on how to do this.  I found the
pamphlet worth reading, as it covers a lot of corner cases, etc., that are worth knowing about.  It also discusses using
custom styles/templates.

The motivations is to answer the question, "Can I stop using LaTeX yet for writing technical documents?".  The answer is
a qualified yes.

I've used LaTeX for all first-author and sole-author papers that I've ever written.  I "like" it, but in a
Stockholm-syndrome kinda way.  LaTeX is the best thing out there, but it is also hard to defend.  Almost everything
about it is un-modern, in terms of syntax, extensibility, odd conflicts between commonly-used packages, etc.  I'd love
to have the power of its typesetting with a modern markup syntax.

## Installing pandoc-crossref on Ubuntu

To get various types of cross-referencing working, you need this filter. 

pandoc is written in Haskell, which is a language with a difficult packaging situation.  There's a PPA for Ubuntu with a
more recent compiler, etc., but not the packages. So, I built it:

```
sudo apt-get -f install cabal-install
cabal update
cabal install pandoc-crossref pandoc-citeproc
```

The above will download about a zillion things and build pandoc plus the two filters.  They'll end up in ~/.cabal/bin,
which I prepend to my PATH in my shell before running nvim:

```
PATH=~/.cabal/bin:$PATH
nvim
```

Doing this allows me to execute 'make' from within nvim.  (It works from the nvim terminal, too!)

## Possible issues with doing this as a LaTeX replacement

1. Apparent poor editor support.  [vimtex](https://github.com/lervag/vimtex) plus
   [syntastic](https://github.com/vim-syntastic/syntastic) spoil me.  The auto-completion of cross references and
   citation keys is an important feature.  Quick googling failed to come up with something that "does vimtex" in a
   markdown file.  Honestly, that makes sense--it may not be reasonable to expect a plugin to be psychic and know what
   the final format of the .md file will be.

2. Not at all sure how "nerdier" LaTeX features are supported: subfigures, etc.  If you are writing a simpler paper,
   where a figure = one idea, this will work great and be easy.  If you are wrting a genomics paper where figures 1-77
   are smooshed into panels a through GG of Figure 1, things may get tricky unless you have all the panels in one image.
   (I always use the subfig environment for multi-panel figures.)
