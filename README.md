
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

If you need a package for multiple platforms, please see the [rdrop2](https://github.com/karthik/rdrop2) by [Karthik Ram](https://github.com/karthik/). This package uses Dropbox's WebAPI via OAuth instead of an operating system specific package. The downside to this approach is the user *must* initiate the push instead of having a background process take care of it.

Dropbox CLI Commands
====================

The commands available via the Dropbox CLI are as follows:

<table>
<colgroup>
<col width="12%" />
<col width="62%" />
<col width="24%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Command</th>
<th align="left">Description</th>
<th align="left"><code>dropcli</code> Functions</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">status</td>
<td align="left">get current status of the dropboxd</td>
<td align="left"><code>dropbox_status()</code></td>
</tr>
<tr class="even">
<td align="left">throttle</td>
<td align="left">set bandwidth limits for Dropbox</td>
<td align="left"><strong>MIA</strong></td>
</tr>
<tr class="odd">
<td align="left">help</td>
<td align="left">provide help</td>
<td align="left"><code>dropbox_help(topic)</code></td>
</tr>
<tr class="even">
<td align="left">puburl</td>
<td align="left">get public url of a file in your dropbox's public folder</td>
<td align="left"><code>dropbox_puburl(fp)</code></td>
</tr>
<tr class="odd">
<td align="left">stop</td>
<td align="left">stop dropboxd</td>
<td align="left"><code>dropbox_stop()</code></td>
</tr>
<tr class="even">
<td align="left">running</td>
<td align="left">return whether dropbox is running</td>
<td align="left"><code>dropbox_running()</code></td>
</tr>
<tr class="odd">
<td align="left">start</td>
<td align="left">start dropboxd</td>
<td align="left"><code>dropbox_start()</code></td>
</tr>
<tr class="even">
<td align="left">filestatus</td>
<td align="left">get current sync status of one or more files</td>
<td align="left"><code>dropbox_filestatus()</code></td>
</tr>
<tr class="odd">
<td align="left">ls</td>
<td align="left">list directory contents with current sync status</td>
<td align="left"><strong>MIA</strong></td>
</tr>
<tr class="even">
<td align="left">autostart</td>
<td align="left">automatically start dropbox at login</td>
<td align="left"><code>dropbox_autostart()</code></td>
</tr>
<tr class="odd">
<td align="left">exclude</td>
<td align="left">ignores/excludes a directory from syncing</td>
<td align="left"><code>**MIA**           | | lansync    |  enables or disables LAN sync                                |      **MIA**           | | sharelink  |  get a shared link for a file in your dropbox                |</code>dropbox_sharelink(fp)`</td>
</tr>
<tr class="even">
<td align="left">proxy</td>
<td align="left">set proxy settings for Dropbox</td>
<td align="left"><strong>MIA</strong></td>
</tr>
</tbody>
</table>

Acknowledgement
===============

The seemingly rapid development of this interface was inspired by [Michael Levy's UseR2016 Talk](http://michaellevy.name/blog/useR-talk-on-teaching-R/) ([See the part at 7:20](https://channel9.msdn.com/Events/useR-international-R-User-conference/useR2016/Teaching-R-to-200-people-in-a-week#time=07m20s)) that details live code piping from the instructor's computer.

The idea presented was very straightforward: **Provide students with a direct link to the code file that updates upon every save done by the instructor.**

The proposed approach alleviated my concerns for students not being able to:

1.  See the code being typed during [STAT 385 @ UIUC](http://stat385.thecoatlessprofessor.com/);
2.  Type code sufficiently fast;
3.  Avoid sitting five feet from me while checking their thousands of [Pokemon Go](http://www.pokemon.com/us/pokemon-video-games/pokemon-go/)

The rest is history...
