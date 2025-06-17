#' Simulate genetic drift with individual sampling
#'
#' @param allele_freq Initial allele frequencies (e.g., c(0.5, 0.5))
#' @param pop_size Number of diploid individuals
#' @param num_generations Number of generations to simulate
#' @return A matrix of allele frequencies across generations
#' @export
simulate_drift_sample <- function(allele_freq, pop_size, num_generations) {
  allele_freq_matrix <- array(0, dim = c(num_generations, 2))

  for (i in 1:num_generations) {
    next_gen <- sample(c("A", "a"), size = pop_size, replace = TRUE, prob = allele_freq)

    allele_freq[1] <- sum(next_gen == "A") / pop_size
    allele_freq[2] <- sum(next_gen == "a") / pop_size

    allele_freq_matrix[i, ] <- allele_freq
  }
  return(allele_freq_matrix)
}

#Example: simulate_drift_sample(allele_freq = c(0.5, 0.5), pop_size = 100, num_generations = 20)
