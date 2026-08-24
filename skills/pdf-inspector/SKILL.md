---
name: pdf-inspector
description: Classify PDFs and extract structured text locally, with Markdown conversion, layout-aware reading order, table detection, and selective OCR routing for scanned or mixed documents. Use when a PDF needs type detection, text extraction, page-level OCR decisions, or machine-readable Markdown.
---

# PDF Inspector

Use the bundled `pdf-inspector` project as the local PDF inspection and extraction backend. Prefer native text extraction before OCR: classify the document first, then route only scanned or low-confidence pages to OCR when the runtime is available.

## Core workflow

1. Accept a PDF path or bytes and preserve the original file.
2. Detect the PDF type: `TextBased`, `Scanned`, `ImageBased`, or `Mixed`; report confidence and pages needing OCR.
3. For text-based pages, extract position-aware text and preserve reading order, multi-column layout, links, headings, lists, code, captions, and tables where detectable.
4. Convert the result to clean Markdown, optionally retaining page-break markers and compact output.
5. For scanned or mixed pages, use selective OCR only when OCR dependencies are installed; otherwise report the exact pages needing OCR and offer a hosted or external OCR fallback.
6. Clearly separate extracted text from interpretation, and flag missing, garbled, or uncertain content.

## Available interfaces

- Python: `pdf_inspector.process_pdf(path)` for detection plus extraction, and `process_pdf_with_ocr(path)` for selective OCR.
- CLI: `detect-pdf file.pdf --json` for classification; `detect-pdf file.pdf --analyze --json` for layout analysis; `pdf2md file.pdf` for Markdown extraction; use `--items-json`, `--pages`, `--select-pages`, or `--compact` when needed.
- Node.js, Rust, and browser WebAssembly bindings are available in the bundled source when the task specifically requires them.

## Output requirements

- Include PDF type, confidence, page count, OCR-routed pages, extraction warnings, and output path or content format when relevant.
- Do not silently treat a scanned PDF as empty text.
- Do not invent text for unreadable regions; preserve page references for follow-up OCR or manual review.
- Use the extracted Markdown as input to downstream literature reading, citation, review, or presentation skills only after checking classification and extraction warnings.

## Scope

This skill handles PDF classification, extraction, layout analysis, Markdown conversion, and OCR routing. It does not by itself perform scholarly interpretation, citation verification, or manuscript writing; route those tasks to the appropriate research skills after extraction.
