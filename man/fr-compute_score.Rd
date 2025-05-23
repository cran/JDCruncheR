% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/QR_functions.R
\encoding{UTF-8}
\name{fr-compute_score}
\alias{fr-compute_score}
\title{Calcul d'un score global}
\arguments{
\item{x}{Objet de type \code{\link{QR_matrix}} ou \code{\link{mQR_matrix}}.}

\item{score_pond}{formule utilisée pour calculer le score global.}

\item{modalities}{modalités triées par ordre d'importance dans le calcul du
score (voir détails).}

\item{normalize_score_value}{Chiffre indiquant la valeur de référence pour la
normalisation des pondérations utilisées lors du calcul du score. Si le
paramètre n'est pas renseigné, les poids ne seront pas normalisés.}

\item{na.rm}{Booléen indiquant si les valeurs manquantes doivent être
enlevées pour le calcul du score.}

\item{n_contrib_score}{Entier indiquant le nombre de variables à créer dans
la matrice des valeurs du bilan qualité contenant les \code{n_contrib_score}
plus grandes contributrices au score (voir détails). S'il n'est pas spécifié,
aucune variable n'est créée.}

\item{conditional_indicator}{\code{list} contenant des listes ayant 3
éléments : "indicator", "conditions" et "condition_modalities". Permet de
réduire à 1 le poids de certains indicateurs en fonction des valeurs d'autres
variables (voir détails).}

\item{thresholds}{\code{list} de vecteurs numériques. Seuils appliqués aux
différents tests afin de classer en modalités \code{Good}, \code{Uncertain},
\code{Bad} et \code{Severe}.
Par défault, la valeur de l'option \code{"jdc_threshold"} est utilisée.
Vous pouvez appeler la fonction \code{\link{get_thresholds}} pour voir à quoi
doit ressemble l'objet \code{thresholds}.}

\item{...}{Autres paramètres non utilisés.}
}
\value{
Un objet de type \code{\link{QR_matrix}} ou \code{\link{mQR_matrix}}.
}
\description{
Permet de calculer un score global à partir d'un bilan qualité
}
\details{
La fonction \code{compute_score} permet de calculer un score à
partir des modalités d'un bilan qualité. Pour cela, chaque modalité est
associée à un poids défini par le paramètre \code{modalities}. Ainsi, le
paramètre par défaut étant \code{c("Good", "Uncertain", "Bad","Severe")},
la valeur \code{"Good"} sera associée à la note 0, la valeur
\code{"Uncertain"} sera associée à la note 1, la valeur \code{"Bad"} sera
associée à la note 2 et la valeur \code{"Bad"} sera associée à la note 3.
Le calcul du score se fait grâce au paramètre \code{score_pond}, qui est un
vecteur numérique nommé contenant des poids et dont les noms correspondent
aux variables de la matrice des modalités à utiliser dans le score. Ainsi,
avec le paramètre
\code{score_pond = c(qs_residual_sa_on_sa = 10, f_residual_td_on_sa = 5)}
le score sera calculé à partir des deux variables \code{qs_residual_sa_on_sa}
et \code{f_residual_td_on_sa}. Les notes associées aux modalités de la
variable \code{qs_residual_sa_on_sa} seront multipliées par 10 et celles
associées à la variable \code{f_residual_td_on_sa} seront multipliées par 5.
Dans le calcul du score, certaines variables peuvent être manquantes: pour ne
pas prendre en compte ces valeurs dans le calcul, il suffit d'utiliser le
paramètre \code{na.rm = TRUE}. Le paramètre \code{normalize_score_value}
permet de normaliser les scores.
Par exemple, si l'on souhaite avoir des notes entre 0 et 20, il suffit
d'utiliser le paramètre \code{normalize_score_value = 20}. Le paramètre
\code{n_contrib_score} permet d'ajouter de nouvelles variables à la matrice
des valeurs du bilan qualité dont les valeurs correspondent aux noms des
variables qui contribuent le plus au score de la série.
\code{n_contrib_score} est un entier égal au nombre de variables
contributrices que l'on souhaite exporter. Par exemple, pour
\code{n_contrib_score = 3}, trois colonnes seront créées et elles
contiendront les trois plus grandes contributrices au score. Les noms des
nouvelles variables sont \emph{i}_highest_score, \emph{i} correspondant au rang en
terme de contribution au score (1_highest_score contiendra les noms des plus
grandes contributrices, 2_highest_score des deuxièmes plus grandes
contributrices, etc). Seules les variables qui ont une contribution non nulle
au score sont prises en compte. Ainsi, si une série a un score nul, toutes
les colonnes \emph{i}_highest_score associées à cette série seront vides. Et si
une série a un score positif uniquement du fait de la variable "m7", alors la
valeur correspondante à la variable 1_highest_score sera égale à "m7" et
celle des autres variables \emph{i}_highest_score seront vides. Certains
indicateurs peuvent n'avoir de sens que sous certaines conditions.
Par exemple, le test d'homoscédasticité n'est valide que si les résidus sont
indépendants et les tests de normalité, que si les résidus sont indépendants
et homoscédastiques. Le paramètre \code{conditional_indicator} permet de
prendre cela en compte en réduisant, sous certaines conditions, à 1 le poids
de certains variables. C'est une \code{list} contenant des listes ayant 3
éléments :
\itemize{
\item "indicator" : nom de la variable pour laquelle on veut ajouter des
conditions
\item "conditions" : nom des variables que l'on utilise pour conditionner
\item "conditions_modalities" : modalités qui doivent être vérifiées pour
modifier le poids Ainsi, avec le paramètre
\code{conditional_indicator = list(list(indicator = "residuals_skewness",
  conditions = c("residuals_independency", "residuals_homoskedasticity"),
  conditions_modalities = c("Bad","Severe")))}, on réduit à 1 le poids de la
variable "residuals_skewness" lorsque les modalités du test d'indépendance
("residuals_independency") ou du test d'homoscédasticité
("residuals_homoskedasticity") valent "Bad" ou "Severe".
}
}
\examples{
# Chemin menant au fichier demetra_m.csv
demetra_path <- file.path(
    system.file("extdata", package = "JDCruncheR"),
    "WS/ws_ipi/Output/SAProcessing-1",
    "demetra_m.csv"
)

# Extraire le bilan qualité à partir du fichier demetra_m.csv
QR <- extract_QR(demetra_path)

# Compute the score
QR <- compute_score(QR, n_contrib_score = 2)
print(QR)

# Extraire les modalités de la matrice
QR[["modalities"]][["score"]]

}
\keyword{internal}
