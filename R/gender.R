#--- Get gender function ---#
#'@title Classifies names based on gender
#'@description Returns an object that classifies inputted names according to gender.
#'@author Charles Crabtree \email{ccrabtr@umich.edu}
#'@param given A vector of given names (i.e. first names).
#'@param family A vector of family names (i.e. surnames or last names).
#'@param key A NameSor API Key (Secret). This is typically a long string of mixed-case letters and numbers.
#'@param user A NameSor API Channel (User). This string contains 'namsor.com', the email address used to register for API access, and a vector of numbers.
#'@return An object that classifies inputted names according to gender.
#'@examples
#' first_name <- c("Volha", "Charles", "Donald")
#' last_name <- c("Chykina", "Crabtree", "Duck")
#' key <- "63m6Yx0zLNAM33krdm3SORekGn8CFB"
#' channel <- "namsor.com/ccrabtr@umich.edu/181283"
#' y <- get_gender(first_name, last_name, key, channel)
#' y
#'@export
#'

get_gender <- function(given, family, secret, user) {
  pb <- txtProgressBar(min = 0, max = length(given), style = 3)
  gender <- data.frame(matrix(NA, nrow = length(given), ncol = 6))
  colnames(gender) <- c("id", "first_name", "last_name", "api_url",
                        "scale", "gender")
  for(i in 1:length(given)) {
    address <- paste0("https://api.namsor.com/onomastics/api/json/gender/",
                     given[i], "/", family[i])
    r <- httr::GET(address, query = list(key1 = secret,
                                        key2 = user))
    r <- httr::content(r, "parse")
    gender[i, ] <- c(i, given[i], family[i], address, r$scale, r$gender)
    setTxtProgressBar(pb, i)
  }
  return(gender)
}