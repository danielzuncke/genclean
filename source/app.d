import std;

int main(string[] args)
{
	foreach (arg; args[1 .. $])
	{
		if (arg.toLower == "-h" || arg.toLower == "--help")
		{
			writefln(
				"%s [file...] ; files get tested for general code problems",
				args[0]
			);
			return 0;
		}
	}

	int problems = 0;

	foreach (arg; args[1 .. $])
		problems += clean(arg);

	return problems;
}

int clean(string file)
{
	if (!file.exists)
	{
		stderr.writefln("skipping %s - doesn't exist", file);
		return 1;
	}

	auto      input = File(file, "r");
	dstring[] lines = input.byLineCopy(KeepTerminator.yes)
		.map!(l => l.to!dstring)
		.array;

	// all cmd's
	int problems  = 0;
	    problems += trailingWhitespace(file, lines);

	return problems;
}

/// Takes lines including their \n, \r, or \r\n terminators.
int trailingWhitespace(string file, dstring[] lines)
{
	foreach (lineNumber, dstring line; lines)
	{
		size_t end = line.length;

		// Strip line terms to find trailing whitespace.
		while (end > 0
		       && (line[end - 1] == '\n' || line[end - 1] == '\r'))
		{
			end--;
		}

		if (end > 0
		    && (line[end - 1] == ' ' || line[end - 1] == '\t'))
		{
			// 1 indexed since that's how it's in editors
			writefln("%s:%d : trailing whitespace", file, lineNumber + 1);
		}
	}

	return 0; // match api; can't fail atm
}
