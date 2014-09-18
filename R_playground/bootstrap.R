### Script to explore the effect of the number of replicates on
### bootstrap results

pdf("plot.pdf")

run.test = function(n_x, n_boot_small, n_boot_large,
  n_replicates_small = 10, n_replicates_large = 1, ...) {

  # n_x number of data points (i.e. the initial dataset size)
  # n_boot_small number of bootstrap resamples for "small" bootstraps
  # n_boot_large number of bootstrap resamples for "large" bootstraps
  # n_replicates_small number of replicates for "small" bootstraps
  # n_replicates_large number of replicates for "large" bootstraps

  set.seed(6)
  
  x = rnorm(n_x) # data points are sampled from a normal distribution
  mean(x)

  plot(0, 0, type = "n", xlim = c(-1, 1), ylim = c(0, 4),
       main = paste("Dataset size", n_x), ...)

  # small bootstraps
  for (i in 1:n_replicates_small) {
    b = unlist(lapply(as.list(1:n_boot_small),
      function(y) mean(sample(x, n_x, T))))
    lines(density(b), col = rgb(0, 0, 1, 0.5))
  }

  # large bootstraps
  for (i in 1:n_replicates_large) {
    b = unlist(lapply(as.list(1:n_boot_large),
      function(y) mean(sample(x, n_x, T))))
    lines(density(b), col = rgb(1, 0, 0, 1), lwd = 2)
  }

  legend("topleft", lty = 1, lwd = c(1, 2),
         col = c(rgb(0, 0, 1, 0.5), rgb(1, 0, 0, 0.5)),
         legend = c(paste(n_boot_small, "BS"),
           paste(n_boot_large, "BS")))
                                              
  
}

par(mfrow = c(2, 2))
n_rep_small = 25
run.test(10, 100, 100000, n_rep_small, 1)
run.test(20, 100, 100000, n_rep_small, 1)
run.test(40, 100, 100000, n_rep_small, 1)
run.test(80, 100, 100000, n_rep_small, 1)

dev.off()
