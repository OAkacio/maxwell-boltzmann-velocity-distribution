# ------------------------------------------------------------------------------
# Script: plot_distribution.R
# Purpose: Generate and save a balanced Maxwell-Boltzmann plot
# ------------------------------------------------------------------------------

# 1. Setup
file_path <- "data/dados.txt"
df <- read.csv(file_path, comment.char = "#", header = TRUE)
colnames(df) <- c("v", "fv")

# Parameters from your data header
v_mp  <- 69.82
v_med <- 78.78
v_rms <- 85.51

# 2. Balanced Proportions & Vertical Space
# Defining a y-limit 20% higher than the peak for "breathing room"
y_max_limit <- max(df$fv) * 1.20

# 3. Save Command (PNG for quick preview, 300 DPI for high quality)
# Balanced 4:3 Aspect Ratio (8x6 inches)
png("figures/maxwell_boltzmann_plot.png", width = 8, height = 6, units = "in", res = 300)

# --- Start Plotting ---
par(mar = c(5, 5, 4, 2) + 0.1, mgp = c(3, 0.7, 0), las = 1)

plot(df$v, df$fv, type = "l", lwd = 3, col = "black",
     xlab = expression(paste("Velocity, ", italic(v), " (m/s)")),
     ylab = expression(paste("Probability Density, ", italic(f(v)), " (s/m)")),
     main = "Maxwell-Boltzmann Velocity Distribution",
     xlim = c(0, 300),
     ylim = c(0, y_max_limit), # Applied balanced height
     bty = "l", cex.lab = 1.2, cex.main = 1.3)

grid(nx = NULL, ny = NULL, col = "gray90", lty = "solid")

# Characteristic Velocity Lines
abline(v = v_mp,  col = "#D55E00", lwd = 2, lty = 2)
abline(v = v_med, col = "#0072B2", lwd = 2, lty = 2)
abline(v = v_rms, col = "#009E73", lwd = 2, lty = 2)

# Legend in English
legend("topright", 
       legend = c(
         expression(italic(v)[mp] == 69.82),
         expression(italic(v)[mean] == 78.78),
         expression(italic(v)[rms] == 85.51)
       ),
       col = c("#D55E00", "#0072B2", "#009E73"), 
       lty = 2, lwd = 2, bty = "n", cex = 1.1)

# --- End Plotting ---
dev.off() # Essential: closes the file and saves it to figures/

cat("Plot successfully saved to figures/maxwell_boltzmann_plot.png\n")