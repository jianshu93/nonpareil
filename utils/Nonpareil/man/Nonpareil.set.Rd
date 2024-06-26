% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Nonpareil.R
\name{Nonpareil.set}
\alias{Nonpareil.set}
\title{Generates a collection of Nonpareil curves (a \code{Nonpareil.Set} object)
and (optionally) plots all of them in a single canvas.}
\usage{
Nonpareil.set(
  files,
  col = NA,
  labels = NA,
  plot = TRUE,
  plot.opts = list(),
  ...
)
}
\arguments{
\item{files}{Vector with the paths to the .npo files.}

\item{col}{Color of the curves (vector). If not passed, values are randomly
assigned. Values are recycled.}

\item{labels}{Labels of the curves (vector). If not passed, values are determined by
the filename. Values are recycled.}

\item{plot}{If TRUE, it generates the Nonpareil curve plots.}

\item{plot.opts}{Any parameters accepted by \code{plot.Nonpareil.Set} as a list.}

\item{...}{Any additional parameters accepted by \code{Nonpareil.curve}.}
}
\value{
Returns invisibly a \code{Nonpareil.Set} object.
}
\description{
Generates a collection of Nonpareil curves (a \code{Nonpareil.Set} object)
and (optionally) plots all of them in a single canvas.
}
\examples{
# Generate a Nonpareil plot with multiple curves
files <- system.file(
  "extdata",
  c("HumanGut.npo", "LakeLanier.npo", "IowaSoil.npo"),
  package = "Nonpareil"
)
col <- c("orange","darkcyan","firebrick4")
nps <- Nonpareil.set(
  files, col = col,
  plot.opts = list(plot.observed = FALSE, model.lwd = 2)
)

# Show the estimated values
print(nps)

# Show current coverage (as \%)
summary(nps)[, "C"] * 100

# Extract Nd diversity index
summary(nps)[, "diversity"]

# Extract sequencing effort for nearly complete coverage (in Gbp)
summary(nps)[, "LRstar"] / 1e9

# Predict coverage for a sequencing effort of 10Gbp
sapply(nps$np.curves, predict, 10e9)
}
