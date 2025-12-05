# LaTeX Formatting Reference

## Margins
`UkrainianAcademic.cls` around line 280:
```latex
\geometry{
    left=25mm,
    right=25mm,
    top=20mm,
    bottom=20mm,
}
```

## Font Sizes
`UkrainianAcademic.cls` lines 58-70:
```latex
\renewcommand{\normalsize}{\fontsize{14}{18}\selectfont}
\renewcommand{\large}{\fontsize{16}{20}\selectfont}
```

## Line Spacing
`UkrainianAcademic.cls` line 55:
```latex
\onehalfspacing   % 1.5 spacing
% or \doublespacing, \singlespacing
```

## Chapter Title Format
`main.tex` lines 35-37:
```latex
\titleformat{\chapter}{\Large\bfseries\centering}
  {\MakeUppercase{РОЗДІЛ~\thechapter.}}{1em}{\MakeUppercase}
```
