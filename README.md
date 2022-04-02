Introduction
===

**twice** is a package especially used for running repeat analyzing in transposable
elements and transcription factors.  

Functions for downstream analysis from [TEKRABber](https://bioconductor.org/packages/3.15/bioc/html/TEKRABber.html) results:
1. `ensIDtoName()`: transform ensembl ID to gene name for human readability.
2. `kznfsComplexHeatmap()`: plot KRAB-ZNFs heatmap taking the input from 
TEKRABber using [ComplexHeatmap package](https://jokergoo.github.io/ComplexHeatmap-reference/book/).
3. `teComplexHeatmap()`: similar to `kznfsComplexHeatmap()` but for transposable elements.
4. `pieTE()`: visualize the abundance of transposable elements in class level using pie chart.
5. `saveTErmsk()`: subset rmsk GTF file (class, family, gene) and save it to rda file.
6. `rmskFilter()`: filter subfamily, subclass of repeatmasker annotation files for downstream analysis.
