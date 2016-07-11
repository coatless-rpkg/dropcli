#' Install Dropbox CLI version on Linux
#'
#' Downloads and installs the linux Dropbox CLI version
#' using advice given \url{https://www.dropbox.com/install?os=lnx}
#' @details
#' Attempts to install Dropbox CLI support in the default location of
#' \code{"~/Dropbox"}, \code{"~/.dropbox-dist/dropboxd"}, and
#' \code{"~/dropbox.py"}.
#' @export
#' @examples
#' \dontrun{
#' # Install Dropbox CLI to local directory
#' install_dropbox_cli()
#' }
install_dropbox_cli = function(){

    require.linux()

    message("Attempting to download dropboxd... ")

    if(get_arch() == "x64"){
        system('cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -')
    }else{
        system('cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -')
    }

    message("Attempting to download the dropbox.py cli tool ... ")
    system("curl -LO https://www.dropbox.com/download?dl=packages/dropbox.py")


    message("Attempting to start dropboxd... \n")
    system("~/.dropbox-dist/dropboxd &")
    message("Started dropboxd ... \n")

    message("Done installing Dropbox CLI!")
}
