.onLoad = function(libname, pkgname) {
    op = options()
    op.dropcli = list(
        dropcli.path = "~/Dropbox",
        dropcli.cmdloc = "~/"
    )
    toset = !(names(op.dropcli) %in% names(op))

    if(any(toset)){
        options(op.dropcli[toset])
    }

    invisible()
}
