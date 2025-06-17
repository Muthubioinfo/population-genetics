#' Plot drift simulation of sampled alleles
#'
#' @param freq_matrix Output from `simulate_drift_sample()`
#' @return A base R plot
#' @export
plot_drift_sample <- function(freq_matrix) {
  num_generations <- nrow(freq_matrix)
  plot(1:num_generations, freq_matrix[, 1], type = "l", ylim = c(0, 1),
       xlab = "Generation", ylab = "Probability of A allele", main = "Genetic Drift Simulation")
  lines(1:num_generations, freq_matrix[, 1], lty = 1, col = "blue")
  lines(1:num_generations, freq_matrix[, 2], lty = 2, col = "red")
  legend("topright", legend = c("A allele", "a allele"), lty = c(1, 2), col = c("blue", "red"))
}
