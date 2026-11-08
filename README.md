Identify "broken windows" in text files. \
General things and some language specifics (eg markdown).

## Features

- find trailing whitespace

## TODO

Collected from things I have seen that should be cleaned up.

### Features

When an item is implemented, move the bullet to [Features](features).

- option to autoclean (this has to be very specific: `autoclean=all`\[this would have to be a keyword\], `autoclean=trailing_whitespace,md_newline_whitespace`, ...)
- find double trailing spaces in .md files where it should be replaced with ` \`
- find control characters in text (assumption: they shouldn't be there; eg. one file was littered with `^S` (device ctrl 3 or smth like that; hitting `C-S` to save but `C-S` was inserted as keycode))
- find non-ascii characters (no auto clean option); maybe just for recognized code files ?
- identify too many sentences per line in markdown file (more than 1)

### Other

- actual help string etc (do the opt parsing)
- allow passing directories; has to be able to skip some special names (`.git/`) and recognize binary files (to some degree, maybe if there is broken unicode then exit)
- each feature should be activatable by a flag
- give each feature it's shorthand by which it can be identified -> named in the option, referenced by autoclean and where autoclean is available etc.
