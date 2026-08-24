---
name: codex-research-workflow
description: Coordinate a Chinese-first, end-to-end academic research workflow from topic discovery and literature processing through writing, visualization, presentation, peer review, revision, statistics, and bilingual academic humanization. Use when the user wants to connect multiple research skills into one coherent project workflow.
---

# Codex Research Workflow

Use this skill as the workflow router for academic research projects. Preserve the user's language, target venue, evidence requirements, and requested deliverable. Do not claim that text has passed an AI detector; improve authorship, clarity, specificity, and natural scholarly voice instead.

## Route by phase

### Phase 1: Topic and literature

- Use `scientific-brainstorming` for topic ideation, frontier trends, and research gaps.
- Use `nature-academic-search` for query expansion and core-literature discovery.
- Use `literature-downloader` for link batches, abstracts, and legally available full text.
- Use `pdf-inspector` to classify PDFs, extract structured text, convert to Markdown, and route scanned pages to OCR.
- Use `nature-reader` for deep reading of one paper, including methods, figures, results, and conclusions.
- Use `literature-review` for cross-paper synthesis and review drafts.

### Phase 2: Manuscript writing

- Use `nature-writing` to turn Chinese ideas, study plans, or results into an English manuscript structure or draft.
- Use `nature-polishing` for English academic logic, phrasing, and style.
- Use `nature-citation` for citation placement, provenance checks, and target-journal reference formatting.
- Use `academic-humanizer` to lower the AIGC-detection rate of English scientific writing by making the prose more natural, author-specific, and evidence-grounded.
- Use `humanizer-zh-academic` to lower the AIGC-detection rate of Chinese academic writing while preserving scholarly meaning and discipline-specific expression.
- For both humanizers, preserve technical meaning, numbers, citations, limitations, and the author's actual claims; never fabricate data, citations, or personal experience.

### Phase 3: Figures and presentations

- Use `nature-figure` or `scientific-visualization` for publication-quality plots and mechanism figures.
- Use `image-to-editable-ppt` to rebuild screenshots, paper figures, or sketches as editable slide elements.
- Use `nature-paper2ppt` for a Chinese presentation from one paper.
- Use `academic-slide-minimalist` or `academic-slide-pragmatic-fallback` for literature-report slide design.
- Use `academic-research-suite` and the literature-report PPT skills for multi-paper review presentations.

### Research code quality

- Use `ponytail` to prefer the smallest adequate implementation and avoid unnecessary complexity in research code.
- Use `ponytail-audit` for a whole-repository audit of over-engineering and avoidable complexity.
- Use `ponytail-debt` to collect and organize `ponytail:` comments and deferred simplification work.
- Use `ponytail-gain` to summarize the measured impact of simplification changes.
- Use `ponytail-help` as the quick reference for the Ponytail suite.
- Use `ponytail-review` for code review focused on unnecessary complexity and simpler alternatives.

### Phase 4: Review, statistics, and coordination

- Use `nature-reviewer` to audit novelty, evidence, experiments, and unsupported conclusions.
- Use `nature-response` to decompose reviewer comments and prepare response and revision plans.
- Use `statistical-analysis` for statistical method selection, assumptions, and reporting checks.
- Use `academic-research-suite` to coordinate staged research-to-paper work and preserve intermediate artifacts.
- Use `office-academic-skill`, `research-writing-skill`, and `scientific-toolkit-skill` for Chinese-first Word, PowerPoint, research writing, and scientific-computing tasks.
- Use the six Ponytail skills together when a research project includes code that needs simplification, audit, debt tracking, impact reporting, review, or usage guidance.

## Coordination rules

1. Identify the current phase, inputs, target output, language, venue, and evidence standard before routing.
2. If several phases are requested, execute them in dependency order and keep a compact project record of sources, decisions, outputs, and unresolved items.
3. Reuse existing artifacts instead of rewriting them; distinguish sourced facts, user-provided results, interpretation, and proposed next steps.
4. For literature and citations, verify current or unstable claims with authoritative sources and never invent bibliographic metadata.
5. For humanization, preserve technical meaning, numbers, citations, limitations, and the author's actual claims.
6. Ask for missing topic, papers, data, target journal, or output format only when it blocks a safe and useful next step; otherwise make the smallest explicit assumption.

## Typical entry requests

- “从研究方向开始，完成选题、检索、阅读和综述草稿。”
- “把这篇论文精读后制作中文汇报 PPT。”
- “将中文研究思路写成英文初稿，再进行学术润色和引用检查。”
- “根据审稿意见制定返修路线并检查统计方法。”
