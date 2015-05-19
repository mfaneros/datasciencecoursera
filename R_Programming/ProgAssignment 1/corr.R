corr <- function(directory, threshold = 0) {
    fileNames <- list.files(directory)
    completeCases <- complete(directory)
    completeCases$fileNames <- fileNames
    thr_Files <- completeCases[completeCases$nobs > threshold, "fileNames"]
    corrList <- NULL
    if (length(thr_Files) == 0) {
        return(corrList)
    } else {
        for (i in 1:length(thr_Files)) {
            path.temp <- paste(".", directory, thr_Files[i], sep="/")
            file.temp <- read.csv(path.temp)
            file.temp <- file.temp[complete.cases(file.temp),]
            corrList[i] <- cor(file.temp$sulfate,file.temp$nitrate)
        }
        return (corrList)
    }
}