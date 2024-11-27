# List of plaquettes

This folder contains a LaTeX document that explicitly list all the plaquettes needed by the `tqec` repository.

## Dependencies

You need any UNIX-compliant version of `make` and `latexmk` in order to compile the LaTeX document in this folder.

## Compiling

A simple 

```sh
make -j8
```

should be enough. The targets `clean` (remove all LaTeX auxilliary files, but not the PDFs) and `cleanall` (remove all LaTeX auxilliary files **AND** the PDFs) are also available.