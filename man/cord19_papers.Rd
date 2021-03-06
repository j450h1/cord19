% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/papers.R
\docType{data}
\name{cord19_papers}
\alias{cord19_papers}
\title{Metadata for papers in the CORD-19 dataset}
\format{A tibble with one observation for each paper, and the following columns:
\describe{
  \item{paper_id}{Unique identifier that can link to full text and citations.
  SHA of the paper PDF.}
  \item{source}{Source (e.g. pubmed, CZI...)}
  \item{title}{Title}
  \item{doi}{Digital Object Identifier}
  \item{pmcid}{pmcid}
  \item{pubmed_id}{PubMed ID}
  \item{license}{License}
  \item{abstract}{Abstract}
  \item{publish_time}{Publication year}
  \item{authors}{Authors}
  \item{journal}{Journal}
  \item{microsoft_academic_paper_id}{Microsoft Academic Paper ID}
  \item{who}{CovidenceWHO}
  \item{has_full_text}{Does it have full text}
}}
\source{
\url{https://www.kaggle.com/allen-institute-for-ai/CORD-19-research-challenge},
specifically the \code{all_sources_metadata_DATE.csv} file.
}
\usage{
cord19_papers
}
\description{
Metadata such as titles, authors, journal, and publication IDs for each
paper in the CORD-19 dataset. This comes from the
\code{all_sources_metadata_DATE.csv} file in the decompressed dataset.
Note that the papers have been deduplicated based on paper_id, doi, or
title, and papers without a paper_id or title have been removed.
}
\examples{

library(dplyr)

# What are the most common journals?
cord19_papers \%>\%
  count(journal, sort = TRUE)

# What are the most common words in titles (or abstracts)?
library(tidytext)

cord19_papers \%>\%
  unnest_tokens(word, title) \%>\%
  count(word, sort = TRUE) \%>\%
  anti_join(stop_words, by = "word")

}
\keyword{datasets}
