#' Simulate allele frequency changes due to genetic drift (Wright–Fisher model)
#'
#' @param N Number of diploid individuals
#' @param p Initial frequency of allele A1
#' @param G Number of generations
#' @param nsim Number of simulation replicates
#' @return A data frame of allele frequencies across generations and simulations
#' @export
simulate_drift_matrix <- function(N, p, G, nsim) {
  n_chromosomes <- 2 * N
  X <- array(0, dim = c(G, nsim))
  X[1, ] <- rep(n_chromosomes * p, nsim)

  for (j in 1:nsim) {
    for (i in 2:G) {
      X[i, j] <- rbinom(1, n_chromosomes, prob = X[i - 1, j] / n_chromosomes)
    }
  }
  df <- data.frame(Generation = 1:G, X / n_chromosomes)
  return(df)
}

#Example: simulate_drift_matrix(N = 200, p = 0.2, G = 100, nsim = 10)

