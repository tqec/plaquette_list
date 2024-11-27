# List of plaquettes

This folder contains a LaTeX document that explicitly list all the plaquettes needed by the `tqec` repository.

## Dependencies

You need any UNIX-compliant version of `make` and `latexmk` in order to compile the LaTeX document in this folder. You also need a working installation of LaTeX with the following packages:

- [`underscore`](https://ctan.org/pkg/underscore) used to allow underscores in many places where it would be interpreted as a special character by mistake.
- [`pgfplots`](https://ctan.org/pkg/pgfplots) and [`pgf/tikz`](https://ctan.org/pkg/pgf) to draw plaquettes and circuits.
- [`xcolor`](https://ctan.org/pkg/xcolor) to define custom colors.
- [`standalone`](https://ctan.org/pkg/standalone) to define standalone PDFs that will then be included in the main document.

## Compiling

A simple 

```sh
make -j8
```

should be enough. The targets `clean` (remove all LaTeX auxilliary files, but not the PDFs) and `cleanall` (remove all LaTeX auxilliary files **AND** the PDFs) are also available.

## Directories

This repository is organized in 2 directories and one main file:

- the main file [`main.tex`](./main.tex) describes the list of plaquettes.
- the [`plaquettes`](./plaquettes/) directory contains all the necessary code to generate plaquette visualisation.
- the [`circuits`](./circuits/) directory contains all the necessary code to generate the circuits represented by each plaquette.

The different `Makefile`s in the directories are managing dependencies between the main file and the different directories (that have to be compiled fully before starting to compile the main file).