\name{build_pedigree}
\alias{build_pedigree}
\title{Build pedigree}
\usage{
build_pedigree(x, self = x[[1]], sire = x[[2]], dam = x[[3]], data)
}
\arguments{
  \item{x}{if given, a vector of length 3 with indices or
  names of columns in \code{data} corresponding to
  \code{self}, \code{sire} and \code{dam} codes}

  \item{self}{index or column name in \code{data} with
  codes of sires}

  \item{sire}{index or column name in \code{data} with
  codes of individuals}

  \item{dam}{index or column name in \code{data} with codes
  of dams}

  \item{data}{a dataframe or a list to take the individual
  codes from}
}
\value{
A well-formed 'pedigree'-class object. Possibly sorted and
recoded.
}
\description{
Builds a full pedigree out of observed data with sorting
and recoding.
}
\details{
A full pedigree requires that all the individual codes for
sires or dams are present as individuals themselves,
possibly with unknown parents. Therefore, for using it in a
statistical model, it is necessary to \emph{complete} the
pedigree by introducing new individuals with unknown
parents.

Furthermore, the codes must be sorted in ascending and
consecutive order begining from 1, and the offspring must
follow parents. All this is checked, and the pedigree is
reordered and recoded if needed.

If recoding is needed, the function issues a warning and an
attribute 'map' is attached to the pedigree, such that
\code{map[i] = j} means that code \code{i} was renumbered
as \code{j}. Therefore, if \code{x} is a vector with
original codes, \code{map[x]} gives the new codes.
Conversely, \code{match(y, map)} back-transforms to
original codes.
}
\examples{
# Founders are missing in the globulus dataset
data(globulus)
check_pedigree(globulus[,c('self', 'dad', 'mum')])
# build_pedigree completes the missing information
ped <- build_pedigree(c('self', 'dad', 'mum'), data = globulus)
check_pedigree(ped)
}
\seealso{
\code{link{check_pedigree}}
}
