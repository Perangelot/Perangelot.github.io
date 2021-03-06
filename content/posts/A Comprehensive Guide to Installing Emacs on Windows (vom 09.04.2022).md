+++
title = "A Comprehensive Guide to Installing emacs on Windows (with daemon!)"
description = "In this post, I will guide you through installing emacs on Windows in such a way that (almost) all features an emacs installation on a linux machine would have are enabled. Most importantly, we will get emacs daemon to run smoothly, which will drastically improve your emacs experience."
date = 2022-03-01T00:00:00+01:00
lastmod = 2022-02-22T14:00:00+01:00
tags = ["emacs", "open-source", "guide"]
type = "post"
draft = false
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [The Problem with emacs on Windows](#the-problem-with-emacs-on-windows)
- <span class="section-num">2</span> [The Solution to the Problem](#the-solution-to-the-problem)
    - <span class="section-num">2.1</span> [Installing `msys2`](#installing-msys2)
    - <span class="section-num">2.2</span> [Configuring `msys2`](#configuring-msys2)
- <span class="section-num">3</span> [Preparing to Install Emacs](#preparing-to-install-emacs)
- <span class="section-num">4</span> [Building Emacs](#building-emacs)
    - <span class="section-num">4.1</span> [Configuring the Installation](#configuring-the-installation)
    - <span class="section-num">4.2</span> [Building Emacs](#building-emacs)
    - <span class="section-num">4.3</span> [Setting the Paths](#setting-the-paths)
- <span class="section-num">5</span> [Setting up an Emacs Daemon](#setting-up-an-emacs-daemon)
- <span class="section-num">6</span> [The Next Part of your Journey](#the-next-part-of-your-journey)

</div>
<!--endtoc-->


## <span class="section-num">1</span> The Problem with emacs on Windows {#the-problem-with-emacs-on-windows}

TECMACS -- the software emacs originates from -- was written in
[1976](https://www.jwz.org/doc/emacs-timeline.html). Given that it has been developed ever since, it is no wonder it
is available for all major operating systems. Nonetheless, some
important functions depend on packages which are not natively
available on Windows, so by default, an emacs installation on Windows
falls short of these.

This should be one more reason [Link] for you to consider changing to
an open-source operating system such as Linux. Please do not just
gloss over this point. Next to security reasons, user-configurability
and extendability, there are compelling arguments -- both
political and ethical -- why you should not support big-tech
companies. Plus there is [Tux](https://en.wikipedia.org/wiki/Tux_(mascot)), the mascot of Linux. And who does not
want a penguin as their mascot?

That being said, some people depend on Windows if they like it or not
(although many people only think this is the case, especially in
academia [Link]), and if they want to use an open-source text editor
instead of Word, this is a big plus already. So, let's start building
emacs from source!


## <span class="section-num">2</span> The Solution to the Problem {#the-solution-to-the-problem}

Since Windows is not capable of providing a satisfactory emacs
experience but Linux is, we simply import all the necessary linux
libraries to Windows. There are many ways to achieve this, but the one
I prefer is to use `msys2`. `msys2` is an open-source software based
on `cygwin` which does exactly what we need: Provide the necessary tools
to build Linux software natively on Windows. So installing this piece of software is the first thing we are going to do.


### <span class="section-num">2.1</span> Installing `msys2` {#installing-msys2}

Visit the [website](https://www.msys2.org/) of `msys2` and download the latest Windows
installer. Double-click it and follow the steps of the installation
wizard. I installed it to `C:\msys64`.


### <span class="section-num">2.2</span> Configuring `msys2` {#configuring-msys2}

Go to `C:\msys64\home\<user>` and open `.bash.rc` with `notepad` by
   double-clicking on the file and, if necessary, selecting the
   notepad among the list of programs. Then, add the following code to
   the end of the file:

```bash
if [ (uname -o) == 'Msys' ]; then
	export PATH=`echo {PATH} | awk -v RS=: -v ORS=: '/c\// {next} {print}' | sed 's/:*//'`
fi
```

This code snippet makes sure that issuing a command in `msys2` which
happens to have the same name as a Windows command won't cause
problems. Lastly, we want to make sure that `msys2` is recognized by
Windows. We do that by setting a so-called `PATH` variable. With that,
we just tell Windows to look for executables in that path. This way,
we make sure that Windows finds `msys2`.

To do that, open the application launcher by pressing the Windows key,
type in "environment variables" and click on the first result. If you
have administrator rights, you can now click on "New" and add both the
path to `msys2` and its subfolder `/bin`. For me, this was
`C:\msys64\mingw64` and `C:\msys64\mingw64\bin`. If you do not have admin
rights, you can just add the paths to your current path(s) by
separating them by semicolons as in `C:\msys64\mingw64\bin;C:\msys64\mingw64\bin`.

And with that, `msys2` is configured! You can now go back to `C:\msys64` and
open `mingw64.exe`.

Warning: Do _not_ open any other of the `.exe` files. Following the below steps with the wrong executable opened _will_ cause problems.


## <span class="section-num">3</span> Preparing to Install Emacs {#preparing-to-install-emacs}

Now we have the _means_ to get all the software we need to build emacs, but
we have not yet downloaded a single file. Thus, the next step is to do clone the packages we need. Conveniently, `msys2` also uses `pacman`, the package manager which by default ships with Arch Linux, so it might even be familiar to you.

First of all, we want to make sure that our package manager is up-to-date:

```bash
pacman -Syu
```

The flags `S`, `y` and `u` stand for "Sync", "refresh" and "sysupdate",
respectively. That being done, we install all tools we need to build
emacs from source, starting with the most important ones:

```bash
pacman -Sy\
	--needed \
	filesystem \
	msys2-runtime \
	bash \
	libreadline \
	libiconv \
	libarchive \
	libgpgme \
	libcurl \
	pacman \
	ncurses \
	libintl
```

Now we'll need to update `pacman` again:

```bash
pacman -Su
```

Finally, we will download and install the necessary
libraries. Depending on your download speed and hardware, this
will take quite a while. Perfect time to rethink whether you really
need Windows. Remember you can also have two systems installed on your
machine [Link] to try out Linux!

```bash
pacman -Su \
	autoconf \
	autogen \
	automake \
	automake-wrapper \
	diffutils \
	git \
	guile \
	libgc \
	libguile \
	libidn-devel \
	libltdl \
	libnettle-devel \
	libopenssl \
	libp11-kit-devel \
	libtasn1-devel \
	libunistring \
	make \
	mingw-w64-x86_64-binutils \
	mingw-w64-x86_64-bzip2 \
	mingw-w64-x86_64-cairo \
	mingw-w64-x86_64-crt-git \
	mingw-w64-x86_64-dbus \
	mingw-w64-x86_64-expat \
	mingw-w64-x86_64-fontconfig \
	mingw-w64-x86_64-freetype \
	mingw-w64-x86_64-gcc \
	mingw-w64-x86_64-gcc-libs \
	mingw-w64-x86_64-gdk-pixbuf2 \
	mingw-w64-x86_64-gettext \
	mingw-w64-x86_64-giflib \
	mingw-w64-x86_64-glib2 \
	mingw-w64-x86_64-gmp \
	mingw-w64-x86_64-gnutls \
	mingw-w64-x86_64-harfbuzz \
	mingw-w64-x86_64-headers-git \
	mingw-w64-x86_64-imagemagick \
	mingw-w64-x86_64-isl \
	mingw-w64-x86_64-jansson \
	mingw-w64-x86_64-libffi \
	mingw-w64-x86_64-libgccjit \
	mingw-w64-x86_64-libiconv \
	mingw-w64-x86_64-libidn2 \
	mingw-w64-x86_64-libjpeg-turbo \
	mingw-w64-x86_64-libpng \
	mingw-w64-x86_64-librsvg \
	mingw-w64-x86_64-libsystre \
	mingw-w64-x86_64-libtasn1 \
	mingw-w64-x86_64-libtiff \
	mingw-w64-x86_64-libunistring \
	mingw-w64-x86_64-libwinpthread-git \
	mingw-w64-x86_64-libxml2 \
	mingw-w64-x86_64-mpc \
	mingw-w64-x86_64-mpfr \
	mingw-w64-x86_64-nettle \
	mingw-w64-x86_64-p11-kit \
	mingw-w64-x86_64-pango \
	mingw-w64-x86_64-pixman \
	mingw-w64-x86_64-poppler \
	mingw-w64-x86_64-winpthreads \
	mingw-w64-x86_64-xpm-nox \
	mingw-w64-x86_64-xz \
	mingw-w64-x86_64-zlib \
	mingw-w64-x86_64-jbigkit \
	nano \
	openssl \
	pkgconf \
	tar \
	texinfo \
	wget
```

Having done this, we could in principle compile emacs from
source. What we should not forget, though, is that emacs lives from
packages -- and they also have dependencies which we need to
install. Of course, the code below might not suffice to cover
all dependencies your packages need, but it takes care of the most
important ones: `hunspell` to make spell-checking work and `poppler` to
allow `pdf-tools` to open `.pdf` files. `sqlite` already is installed with
the binaries above, so `org-roam` (and also `org-roam-ui`) will work.

```bash
pacman -S mingw-w64-x86_64-hunspell \
		  mingw-w64-x86_64-poppler  \
		  mingw-w64-x86_64-poppler-data
```

Note that whilst only an english dictionary is available via `msys2`,
you can add dictionaries of any language you like by putting them
in `C:\msys64\mingw64\share\hunspell`. For a list of dictionaries to
download, visit [this page](https://github.com/elastic/hunspell/tree/master/dicts). Of course, you will need to adjust the
emacs code, too, then. But this is a topic for [Link] another post.

For those who want to use emacs as a `LaTeX` editor or like having their
formulas overlayed with `org-preview`, you should also install the `texlive`
binaries. This installation should happen without the help of msys2;
if you already have a LaTeX distribution installed, emacs will
recognize it once it is configured. If not, you will need to install it. The
easiest way I have found is to install TeXlive using an `.iso` [image](https://www.tug.org/texlive/acquire-iso.html). There is also [MiKTeX](https://miktex.org/), but it ships with a minimal install of packages which, depending on your needs, might not suffice. You can install packages manually, though.

If you think of using `mu4e` as your emacs client on Windows, this might be a
problem because there is no `msys2` package for `mu`. You might try your
luck with an [unofficial package](https://github.com/msys2-unofficial/MSYS2-packages/tree/master/mu), though.


## <span class="section-num">4</span> Building Emacs {#building-emacs}

Now we have done everything we need to start with the actual building
process, so we are going to download the emacs source code from an
official github repository:

```bash
git clone http://git.savannah.gnu.org/r/emacs.git
```


### <span class="section-num">4.1</span> Configuring the Installation {#configuring-the-installation}

Next up, we need to tell emacs what (not) to build. I have chosen to
go with every sensible dependency to cover all needs:

If you get an error message, you are likely in the wrong folder. Make
sure the folder contains `autogen.sh`. You can do that by running `ls`,
which lists the contents of the folder the console currently operates in.


### <span class="section-num">4.2</span> Building Emacs {#building-emacs}

Now, we're finally ready to do the last step: Actually installing
emacs! This will take at least 10 minutes, possibly up to 30. Just run
the following code:

```bash
make
make install
```


### <span class="section-num">4.3</span> Setting the Paths {#setting-the-paths}

With this, you have built your own emacs from source --
Congratulations! To run emacs, we still need to put two files in the
binary folder: `libdbus-1-3.dll` and `libgmp-10.dll`. You can download
them [here](https://www.exefiles.com/de/dll/libdbus-1-3-dll/) and [here](https://www.dll-files.com/libgmp-10.dll.html), respectively. Just open the Windows explorer, type
`%APPDATA%` in the folder bar and press <kbd>Enter</kbd>. You will now be in
`C:\Users\<user>\AppData\Roaming`. Open the folder called `bin` and put
the `.dll` file in there. If you now double-click on `runemacs.exe`,
emacs should open.


## <span class="section-num">5</span> Setting up an Emacs Daemon {#setting-up-an-emacs-daemon}

Since emacs is not a Windows program, its performance on Windows is,
to put it mildly, not out of this world. Especially if
you have a large configuration file, it might take half a minute or even
longer to get it started. This, of course, completely interferes with
your workflow, so we'll need to find a way to deal with that. And the
way to go is as simple as silently starting emacs at startup and
letting it pop up whenever we want to edit a file in it. This
running-in-the-background service is called a _server_ or a _daemon_.

On Linux, setting up a daemon is as simple as typing in a single
command. On Windows, on the other hand, things aren't as easy (as is
often the case). To alleviate at least some of the despair, I have
written some code which takes care of it and converted it to `.exe`
files. Just download all the `.exe` files and put them in the folder in
which the other emacs executables are. For me, it was
`C:\Users\Vitus\AppData\Roaming\bin`. Since this folder by default is in
the `Path` variable, we can skip the first step of the instructions on
the github page and only need to follow the other 8 steps described on
github; this will approximately take 5 minutes. And that's it. Now you
have successfully installed the emacs daemon -- Congratulations!


## <span class="section-num">6</span> The Next Part of your Journey {#the-next-part-of-your-journey}

If you have followed this guide up until now, your emacs is ready to
use, but it will look unfamiliar and the keybindings will be very different
from Windows, so you are likely to be completely overwhelmed. This is
normal, and I was, too. For this, reason, as a next step, you will need
to set up a configuration file which will make your life easier. If
you now feel even more overwhelmed, no worries, this [Link] post is
for you. Should you already know how setting up such a file works and
just want the familiar keybindings, you might want to check out [Link]
this post.

For those die-hards who already know all this, just put your
configuration file in the folder which in turn contains `bin`. For me, that was
`C:\Users\Vitus\AppData\Roaming`. Note that, especially
if you use the famous package-manager `use-package`, you might need to
start it more than once to get every package installed.