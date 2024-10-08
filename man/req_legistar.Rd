% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/legistar.R
\name{req_legistar}
\alias{req_legistar}
\title{Create Legistar Web API Request with template}
\usage{
req_legistar(
  ...,
  template = "actions",
  client = getOption("legistarapi.client"),
  call = caller_env()
)
}
\arguments{
\item{...}{Template variables.}

\item{template}{A template string which consists of a optional HTTP method
and a path containing variables labelled like either \verb{:foo} or \code{{foo}}.}
}
\description{
\code{req_legistar()} uses \code{request_legistar()} and \code{httr2::req_template()} to
create a Legistar Web API Request.
}
\keyword{internal}
