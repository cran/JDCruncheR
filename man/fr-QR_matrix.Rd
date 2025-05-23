% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/QR_matrix_classes.R
\encoding{UTF-8}
\name{fr-QR_matrix}
\alias{fr-QR_matrix}
\title{Objets bilan qualité}
\arguments{
\item{modalities}{un \code{data.frame} contenant les modalités (Good, Bad,
etc.) associées aux variables.}

\item{values}{un \code{data.frame} contenant les valeurs (p-valeurs des
tests, statistiques, etc.) associées aux variables. Peut donc contenir plus
de variables que le data.frame \code{modalities}.}

\item{score_formula}{formule utilisée pour calculer le score global (s'il
existe).}

\item{x}{un objet de type \code{\link{QR_matrix}}, \code{\link{mQR_matrix}}
ou une liste d'objets \code{\link{QR_matrix}}.}

\item{...}{des objets du même type que \code{x}.}
}
\value{
\code{QR_matrix()} crée et renvoie un objet \code{\link{QR_matrix}}.
\code{mQR_matrix()} crée et renvoie un objet \code{\link{mQR_matrix}}
(c'est-à-dire une liste d'objets \code{\link{QR_matrix}}).
\code{is.QR_matrix()} et \code{is.mQR_matrix()} renvoient des valeurs
booléennes (\code{TRUE} ou \code{FALSE}).
}
\description{
\code{QR_matrix()} permet de créer un objet de type \code{\link{QR_matrix}}
contenant un bilan qualité.
}
\details{
\code{mQR_matrix()} permet de créer un objet de type \code{\link{mQR_matrix}}
qui est une liste de bilans qualité (donc d'objets \code{\link{QR_matrix}}).

\code{is.QR_matrix()} et \code{is.mQR_matrix()} permettent de tester si un
objet est un bilan qualité ou une liste de bilans qualité.

Un objet  de type \code{\link{QR_matrix}} est une liste de trois
paramètres :
\itemize{
\item le paramètre \code{modalities} est un \code{data.frame} contenant un
ensemble de variables sous forme catégorielle (par défaut : Good,
Uncertain, Bad, Severe).
\item le paramètre \code{values}  est un \code{data.frame} contenant les valeurs
associées aux indicateurs présents dans \code{modalities} (i.e. :
p-valeurs, statistiques, etc.), ainsi que des variables qui n'ont pas de
modalité (i.e. : fréquence de la série, modèle ARIMA, etc).
\item le paramètre \code{score_formula} contient la formule utilisée pour
calculer le score (une fois le calcul réalisé).
}
}
\keyword{internal}
