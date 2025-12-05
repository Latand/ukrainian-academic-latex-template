# LaTeX Content Reference

## Text Formatting
- Bold: `\textbf{text}`
- Italic: `\textit{text}`
- Ukrainian quotes: `<<текст>>`

## Lists
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

## Formulas
```latex
% Inline
$E = mc^2$

% Display (numbered)
\begin{equation}
    F = ma
    \label{eq:newton}
\end{equation}

% Reference: equation~\ref{eq:newton}
```

## Tables
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

## Figures
```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{images/filename}
    \caption{Figure caption}
    \label{fig:example}
\end{figure}
```
