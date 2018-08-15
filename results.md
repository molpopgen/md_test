# Results

See [@sec:boo].

Also see [@fig:figure].  

Subfig refs @fig:sfig and @fig:sfig2 are found in @fig:foo.

![This is a figure related to @Kelleher2018-fu](new_benchmarks){#fig:figure}

\begin{figure}
\centering
\subfloat[][Foo \label{fig:sfig}]{\includegraphics[height=2in,width=2in]{new_benchmarks}}
\subfloat[][Foo2 \label{fig:sfig2}]{\includegraphics[height=2in,width=2in]{new_benchmarks}}
\caption{\label{fig:foo}}
\end{figure}


