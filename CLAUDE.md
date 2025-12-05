# Ukrainian Academic LaTeX Template

Ukrainian academic documents (essays, reports, dissertations). LuaLaTeX + Biber.

## What You Can Do

**Write content** - Edit `chapters/*.tex` files with document text

**Add chapters** - Create `chapters/chapterN.tex`, add `\input{chapters/chapterN}` to `main.tex`

**Set metadata** - Edit config block in `main.tex`:
```latex
\thesistitle{...}
\author{...}
\supervisor{...}
\university{...}
```

**Add bibliography** - Add entries to `refs.bib`, cite with `\cite{key}`

**Change formatting** - Edit `UkrainianAcademic.cls` (margins, fonts, spacing)

**Build** - Run `just build` or `just docker-build`

## Files

| File | Purpose |
|------|---------|
| `main.tex` | Entry point, metadata |
| `UkrainianAcademic.cls` | Formatting rules |
| `chapters/*.tex` | Content |
| `refs.bib` | Bibliography |
| `frontmatter/*.tex` | Title page, abstracts |

## Style References

- @llms/formatting.md - margins, fonts, spacing
- @llms/content.md - text, lists, formulas, tables, figures
- @llms/bibliography.md - BibTeX examples
