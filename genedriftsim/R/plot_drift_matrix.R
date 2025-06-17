#' Plot simulated drift matrix
#'
#' @param freq_matrix Output from `simulate_drift_matrix()`
#' @return A ggplot object
#' @export
plot_drift_matrix <- function(freq_matrix) {
  library(reshape2)
  library(ggplot2)
  sim_data <- reshape2::melt(freq_matrix, id.vars = "Generation",
                             variable.name = "Simulation", value.name = "Frequency")
  G <- nrow(freq_matrix)
  nsim <- ncol(freq_matrix)

  ggplot(sim_data, aes(x = Generation, y = Frequency, colour = Simulation)) +
    geom_line() +
    xlab("Generation") +
    ylab("Allele Frequency") +
    ylim(0, 1) +
    labs(colour = "Simulations")
}


