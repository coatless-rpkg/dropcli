#' Issue Dropbox Commands to System
#'
#' Enables the use of the system terminal's
#' \code{"dropbox.py"} CLI interface.
#' @param cmd      A \code{string} containing the command and option.
#' @param dbpy_loc A \code{string} indicating the location of
#' the \code{"dropbox.py"} CLI interface.
#' @param intern   A \code{bool} that represents whether output should
#' be returned as a \code{character vector} or not.
#' @export
#' @examples
#' \dontrun{
#' # Start process
#' dropbox_command("start")
#' }
dropbox_command = function(cmd, dbpy_loc = getOption("dropcli.cmdloc", "~/"), intern = TRUE){
    message("Executing ", cmd, " via ", dbpy_loc,"dropbox.py")
    system(paste0(dbpy_loc, "dropbox.py ", cmd), intern = intern)
}

#' Enable or Disable the autostartup feature
#'
#' Tries to enable autostartup when a user is detected as logged in.
#' @param autostart A \code{boolean} indicating \code{TRUE} (enabled)
#' or \code{FALSE} (disabled) autostart of the dropbox daemon.
#' @details
#' This is feature is required for the Dropbox CLI package to work as R
#' will otherwise close connections quickly.
#' @export
#' @examples
#' \dontrun{
#' # Enable Autostart
#' dropbox_autostart(T)
#'
#' # Disable Autostart
#' dropbox_autostart(F)
#' }
dropbox_autostart = function(autostart = T){

    require.linux()

    if(!is.logical(autostart)){
        stop("Autostart must be logical.")
    }

    if(autostart){
        dropbox_command("autostart y")
    }else{
        dropbox_command("autostart n")
    }

}

#' Start the Dropbox Daemon
#'
#' Turns the dropbox daemon online
#' @export
#' @examples
#' \dontrun{
#' # Start the daemon
#' dropbox_start()
#' }
dropbox_start = function(){
    dropbox_command("start")
}

#' Stop the Dropbox Daemon
#'
#' Turns the dropbox daemon off
#' @export
#' @examples
#' \dontrun{
#' # Stop the daemon
#' dropbox_stop()
#' }
dropbox_stop = function(){
    dropbox_command("stop")
}


#' Dropbox Daemon Status
#'
#' Retrieves the present daemon status
#' @export
#' @examples
#' \dontrun{
#' # Daemon status
#' dropbox_status()
#' }
dropbox_status = function(){
    dropbox_command("status")
}


#' Is Dropbox Running?
#'
#' Determines whether or not the dropbox daemon is running.
#' @inheritParams dropbox_command
#' @return A \code{bool} containing either \code{TRUE} (running) or
#' \code{FALSE} (not running)
#' @export
#' @examples
#' \dontrun{
#' # Check to see if dropbox is running
#' dropbox_running()
#' }
dropbox_running = function(){
    # Forces return as TRUE or FALSE
    dropbox_command("running", intern = FALSE) == 1
}

#' Dropbox Help Command
#'
#' Retrieves the present daemon status
#' @param topic A \code{string} containing a valid command or \code{NULL}
#' @inheritParams dropbox_command
#' @details
#' Valid \code{topic}s are:
#' \tabular{rr}{
#' status     \tab   get current status of the dropboxd                      \cr
#' throttle   \tab   set bandwidth limits for Dropbox                        \cr
#' help       \tab   provide help                                            \cr
#' puburl     \tab   get public url of a file in your dropbox's public folder\cr
#' stop       \tab   stop dropboxd                                           \cr
#' running    \tab   return whether dropbox is running                       \cr
#' start      \tab   start dropboxd                                          \cr
#' filestatus \tab   get current sync status of one or more files            \cr
#' ls         \tab   list directory contents with current sync status        \cr
#' autostart  \tab   automatically start dropbox at login                    \cr
#' exclude    \tab   ignores/excludes a directory from syncing               \cr
#' lansync    \tab   enables or disables LAN sync                            \cr
#' sharelink  \tab   get a shared link for a file in your dropbox            \cr
#' proxy      \tab   set proxy settings for Dropbox                          \cr
#' }
#'
#' If \code{NULL}  is supplied then the above index is printed.
#' @export
#' @examples
#' \dontrun{
#' # Get standard help table
#' dropbox_help()
#'
#' # Request help with puburl
#' dropbox_help("puburl")
#' }
dropbox_help = function(topic = NULL){
    if(is.null(topic) || !is.character(topic)){
        dropbox_command("help")
    }else{
        dropbox_command(paste0("help", topic))
    }
}

#' Obtain the File URL in a Public Folder
#'
#' Returns the Public File URL in Dropbox's public folder
#' @param fp       A \code{string} containing the file path that is within the \code{"Public"} folder.
#' @details
#' The file must be located \strong{within} the \code{Public} directory
#' @export
#' @examples
#' \dontrun{
#' # Return the file
#' dropbox_puburl("path/to/Public/file.R")
#' }
dropbox_puburl = function(fp){
    if( isTRUE(grepl("\\bPublic\\b",fp)) ) {

        if(file.exists(fp)){
            dropbox_command(paste0("puburl ", fp))
        } else {
            stop("Error: The requested file does not exist on the disk!")
        }

    } else {
        stop("Error: File is not in the `Public` folder. Please use `dropbox_sharelink()`!")
    }
}

#' Enable Live View of Dropbox File in Browser
#'
#' @inheritParams dropbox_puburl
#' @details
#' To get the "live" aspect of the code view,
#' we opt to set the shared link to have a \code{"?dl=0"}.
#' This forces the file to only show in the browser.
#' For more details please see:
#' \href{https://www.dropbox.com/en/help/201}{How do I force a file or folder to download or render on dropbox.com?}
#'
#' This was inspired by \href{http://michaellevy.name/blog/useR-talk-on-teaching-R/}{Michael Levy's UseR2016 Talk}
#'  (\href{https://channel9.msdn.com/Events/useR-international-R-User-conference/useR2016/Teaching-R-to-200-people-in-a-week#time=07m20s}{See the part at 7:20})
#' @details
#' The file must be located within the \code{Public} directory
#' @export
#' @examples
#' \dontrun{
#' # Return the file with live streaming enabled
#' dropbox_puburl_live("path/to/Public/file.R")
#' }
dropbox_puburl_live = function(fp){
    paste0(dropbox_puburl(fp), "?dl=0")
}


#' Obtain the File URL in a Public Folder
#'
#' Returns the Public File URL in Dropbox's public folder
#' @param fp       A \code{string} containing the file path that is within the \code{"Public"} folder.
#' @details
#' The file must be located \strong{outside} of the \code{Public} directory
#' @export
#' @examples
#' \dontrun{
#' # Return the file
#' dropbox_sharelink("path/to/file.R")
#' }
dropbox_sharelink = function(fp){

    if( !isTRUE(grepl("\\bPublic\\b",fp)) ) {

        if(file.exists(fp)){
            dropbox_command(paste0("sharelink ", fp))
        } else {
            stop("Error: The requested file does not exist on the disk!")
        }

    } else {
        stop("Error: File is located in the `Public` folder. Please use `dropbox_publink()`!")
    }
}

#' Enable Live View of Dropbox File in Browser
#'
#' @inheritParams dropbox_sharelink
#' @details
#' To get the "live" aspect of the code view,
#' we opt to set the shared link to have a \code{"?dl=0"}.
#' This forces the file to only show in the browser.
#' For more details please see:
#' \href{https://www.dropbox.com/en/help/201}{How do I force a file or folder to download or render on dropbox.com?}
#'
#' This was inspired by \href{http://michaellevy.name/blog/useR-talk-on-teaching-R/}{Michael Levy's UseR2016 Talk}
#'  (\href{https://channel9.msdn.com/Events/useR-international-R-User-conference/useR2016/Teaching-R-to-200-people-in-a-week#time=07m20s}{See the part at 7:20})
#' The file must be located \strong{outside} of the \code{Public} directory
#' @export
#' @examples
#' \dontrun{
#' # Return the file with live streaming enabled
#' dropbox_sharelink_live("path/to/file.R")
#' }
dropbox_sharelink_live = function(fp){
    paste0(dropbox_sharelink(fp), "?dl=0")
}

