
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/coatless/dropcli.svg?branch=master)](https://travis-ci.org/coatless/dropcli)[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/dropcli)](https://cran.r-project.org/package=dropcli)

`dropcli` - Dropbox CLI support for Linux Machines
==================================================

The objective of this package is to provide Command Line Interface (CLI) support within *R* for the Linux version of Dropbox.

The CLI is provided by Dropbox's [dropbox.py interface](https://www.dropbox.com/en/help/9192) that is only available on Linux. For details, please see [No support for CLI exists on OS X or Windows](http://superuser.com/questions/678925/using-dropbox-from-the-command-line-on-osx).

As a result, all commands are run through:

``` bash
~/dropbox.py <command> <options>
```

Please **note** this package is a work in progress (WIP) and is *not* suitable for production use or teaching without knowing what is going on.

Dropbox CLI Commands
====================

The commands available via the Dropbox CLI are as follows:

| Command    | Description                                              |
|------------|----------------------------------------------------------|
| status     | get current status of the dropboxd                       |
| throttle   | set bandwidth limits for Dropbox                         |
| help       | provide help                                             |
| puburl     | get public url of a file in your dropbox's public folder |
| stop       | stop dropboxd                                            |
| running    | return whether dropbox is running                        |
| start      | start dropboxd                                           |
| filestatus | get current sync status of one or more files             |
| ls         | list directory contents with current sync status         |
| autostart  | automatically start dropbox at login                     |
| exclude    | ignores/excludes a directory from syncing                |
| lansync    | enables or disables LAN sync                             |
| sharelink  | get a shared link for a file in your dropbox             |
| proxy      | set proxy settings for Dropbox                           |

Acknowledgement
===============

The seemingly rapid development of this interface was inspired by [Michael Levy's UseR2016 Talk](http://michaellevy.name/blog/useR-talk-on-teaching-R/) ([See the part at 7:20](https://channel9.msdn.com/Events/useR-international-R-User-conference/useR2016/Teaching-R-to-200-people-in-a-week#time=07m20s)) that details live code piping from the instructor's computer.

This alleviated my concerns for students not being able to:

1.  See the code being typed during [STAT 385 @ UIUC](http://stat385.thecoatlessprofessor.com/);
2.  Type code sufficiently fast;
3.  Avoid the sitting five feet from me while checking [Pokemon Go](http://www.pokemon.com/us/pokemon-video-games/pokemon-go/)

The idea Michael presented was very straightforward: **Provide them with a direct link to the code file that updates upon ever save.**

To do that, there are a few things we need:

1.  A Linux machine ([No support for CLI exists on OS X or Windows](http://superuser.com/questions/678925/using-dropbox-from-the-command-line-on-osx))
2.  RStudio Server (Pro preferred)
3.  An obscure Dropbox knowledge base article entitled [How do I force a file or folder to download or render on dropbox.com?](https://www.dropbox.com/en/help/201)
4.  `dropcli`

Alternatively, you can use a local Dropbox install and **manually** go through the process of enabling a Public document shared URL. Though, I found this to be the easier approach as I run the [STATS@UIUC Online Analytical Environment](https://rstudio.stat.illinois.edu/).

The rest is history...
