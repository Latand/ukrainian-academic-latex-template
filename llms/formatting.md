# LaTeX Formatting Reference

## Margins
`UkrainianAcademic.cls` (MARGINS section):
```latex
\geometry{
    left=25mm,
    right=25mm,
    top=20mm,
    bottom=20mm,
}
```

## Font Sizes
`UkrainianAcademic.cls` (FONT SIZES section):
```latex
\renewcommand{\normalsize}{\fontsize{14}{18}\selectfont}
\renewcommand{\large}{\fontsize{16}{20}\selectfont}
```

## Line Spacing
`UkrainianAcademic.cls` (LINE SPACING section):
```latex
\onehalfspacing   % 1.5 spacing
% or \doublespacing, \singlespacing
```

## Chapter/Section Formatting
`UkrainianAcademic.cls` (CHAPTER AND SECTION FORMATTING section):
```latex
% Chapter: "РОЗДІЛ 1. НАЗВА" centered, uppercase
\titleformat{\chapter}{\Large\bfseries\centering}
  {\MakeUppercase{РОЗДІЛ~\thechapter.}}{1em}{\MakeUppercase}

% Section
\titleformat{\section}{\large\bfseries}{\thesection}{1em}{}
```
