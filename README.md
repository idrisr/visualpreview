# visual preview

this is the script that needs to be run in vifm to do visual previews. i'm doing
a vifm module, so this package needs to be provided to vifm so that it's part of
and then it can find it for previews.

i think that there should be two options for a package
    vifm itself
    the previewer
        list of packages which will be added to the path of
        vifm via makewrapper

    then also the book-note previewer can also be added to the module

# flake

this flake should configure a pre commit git hook and a flake check using the
same packages. devenv and pre-commit

# flake check and pre-commit

I want to increase the quality of my code such that each code adheres to some
minimum level of quality. Quality checks incude things like: file formatting,
and test suite passing.

I want to distribute these checks via flakes. I want the checks to exist for
both git commits, and when manually invoking nix flake check.
