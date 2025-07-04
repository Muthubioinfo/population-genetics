% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_drift_sample.R
\name{simulate_drift_sample}
\alias{simulate_drift_sample}
\title{Simulate genetic drift with individual sampling}
\usage{
simulate_drift_sample(allele_freq, pop_size, num_generations)
}
\arguments{
\item{allele_freq}{Initial allele frequencies (e.g., c(0.5, 0.5))}

\item{pop_size}{Number of diploid individuals}

\item{num_generations}{Number of generations to simulate}
}
\value{
A matrix of allele frequencies across generations
}
\description{
Simulate genetic drift with individual sampling
}
