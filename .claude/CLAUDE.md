# Ukrainian Academic LaTeX Template

## What This Project Is

A LaTeX template for Ukrainian academic documents (essays, reports, dissertations).
Uses **LuaLaTeX** for Ukrainian font support and **Biber** for bibliography.

This template follows Ukrainian academic standards:
- Times New Roman font, 14pt base size
- 1.5 line spacing
- 25mm margins on all sides
- Numbered chapters and sections

## Key Files and What They Do

| File | Purpose | When to Edit |
|------|---------|--------------|
| `main.tex` | Entry point, document metadata | Set title, author, supervisor, add chapters |
| `UkrainianAcademic.cls` | Formatting rules | Change margins, fonts, spacing, section styles |
| `frontmatter/titlepage.tex` | Title page layout | Modify institution header, document type |
| `frontmatter/abstract_ua.tex` | Ukrainian abstract | Write abstract content |
| `frontmatter/abstract_en.tex` | English abstract | Write English abstract |
| `frontmatter/abbreviations.tex` | Terminology list | Add abbreviations |
| `chapters/*.tex` | Document content | Write actual chapters |
| `refs.bib` | Bibliography | Add sources |
| `justfile` | Build commands | Add new build recipes |

## How to Edit This Template

### Adding a New Chapter

1. Create new file: `chapters/chapter2.tex`
2. Start with:
   ```latex
   \chapter{НАЗВА РОЗДІЛУ}

   Вміст розділу...

   \section{Секція}
   ...
   ```
3. Add to `main.tex` before conclusions:
   ```latex
   \input{chapters/chapter2}
   ```

### Changing Document Metadata

Edit the configuration block at the top of `main.tex`:
```latex
\thesistitle{Назва документа}
\author{Прізвище І.П.}
\supervisor{д.т.н., проф. Прізвище І.П.}
\university{Назва університету}
\faculty{Назва факультету}
\department{Назва кафедри}
\specialty{000 Назва спеціальності}
\keywords{ключові, слова, тут}
```

### Modifying Formatting

**Margins** - `UkrainianAcademic.cls` around line 280:
```latex
\geometry{
    left=25mm,
    right=25mm,
    top=20mm,
    bottom=20mm,
}
```

**Font sizes** - `UkrainianAcademic.cls` lines 58-70:
```latex
\renewcommand{\normalsize}{\fontsize{14}{18}\selectfont}  % base size
\renewcommand{\large}{\fontsize{16}{20}\selectfont}       % section titles
```

**Line spacing** - `UkrainianAcademic.cls` line 55:
```latex
\onehalfspacing   % 1.5 spacing (Ukrainian standard)
% or \doublespacing, \singlespacing
```

**Chapter title format** - `main.tex` lines 35-37:
```latex
\titleformat{\chapter}{\Large\bfseries\centering}
  {\MakeUppercase{РОЗДІЛ~\thechapter.}}{1em}{\MakeUppercase}
```

### Adding Bibliography Entries

Add to `refs.bib` in BibTeX format:

```bibtex
% Book
@book{key,
  author = {Прізвище, І. І.},
  title = {Назва книги},
  publisher = {Видавництво},
  year = {2024},
}

% Journal article
@article{key,
  author = {Author, A.},
  title = {Article Title},
  journal = {Journal Name},
  year = {2024},
  volume = {1},
  pages = {1--10},
  doi = {10.1000/example},
}

% Website
@misc{key,
  author = {{Organization}},
  title = {Page Title},
  year = {2024},
  howpublished = {\url{https://example.com}},
  note = {Дата звернення: грудень 2024},
}
```

Cite in text: `\cite{key}` or `\cite{key1, key2}`

### Writing Content

**Text formatting:**
- Bold: `\textbf{text}` (avoid in running text per Ukrainian standards)
- Italic: `\textit{text}`
- Quotes: `<<текст>>` for Ukrainian guillemets

**Lists:**
```latex
\begin{itemize}
    \item First item
    \item Second item
\end{itemize}

\begin{enumerate}
    \item Numbered item
    \item Another item
\end{enumerate}
```

**Formulas:**
```latex
% Inline
$E = mc^2$

% Display (numbered)
\begin{equation}
    F = ma
    \label{eq:newton}
\end{equation}

% Reference: see equation~\ref{eq:newton}
```

**Tables:**
```latex
\begin{table}[htbp]
    \centering
    \caption{Table caption}
    \begin{tabular}{lcc}
        \toprule
        Header 1 & Header 2 & Header 3 \\
        \midrule
        Data & Data & Data \\
        \bottomrule
    \end{tabular}
    \label{tab:example}
\end{table}
```

**Figures:**
```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{images/filename}
    \caption{Figure caption}
    \label{fig:example}
\end{figure}
```

## Build Commands

| Command | Description |
|---------|-------------|
| `just build` | Compile to PDF (output in `pdf/main.pdf`) |
| `just clean` | Remove all build artifacts |
| `just open` | Open PDF in default viewer |
| `just watch` | Auto-rebuild on file changes |
| `just view` | Build then open |

## Common Issues

**Font errors: "Font Times New Roman not found"**
- Install the font: `sudo apt install ttf-mscorefonts-installer`
- Or change font in `UkrainianAcademic.cls` line 53

**Bibliography not appearing**
- Run `just build` twice (first pass creates .bbl, second includes it)
- Check for BibTeX syntax errors in `refs.bib`

**Ukrainian text looks wrong (boxes or missing characters)**
- Must use LuaLaTeX, not pdfLaTeX
- Check that `polyglossia` package is loaded in `main.tex`

**Undefined control sequence errors**
- Check that all `\cite{key}` references exist in `refs.bib`
- Check that all `\ref{label}` references have corresponding `\label{label}`

## Workflow Tips

1. **Start with metadata** - Fill in `main.tex` configuration first
2. **Write content** - Edit chapter files, don't worry about formatting
3. **Build often** - Run `just build` frequently to catch errors early
4. **Commit regularly** - Use git to track changes

## File Locations Summary

```
main.tex:35-40        → Chapter formatting
main.tex:10-18        → Document metadata
UkrainianAcademic.cls:55    → Line spacing
UkrainianAcademic.cls:58-70 → Font sizes
UkrainianAcademic.cls:280   → Page margins
refs.bib              → All bibliography entries
frontmatter/          → Title page and abstracts
chapters/             → All content chapters
```
