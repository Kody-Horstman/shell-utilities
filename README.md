# shell-utilities
Utility functions for shell scripting.

## Usage

### Acquiring
Please refer to GitHub Documentation for a guide on [cloning a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository).

### Importing a utility file into a shell script
Assume you cloned this repository to /home/$USER/scripts/shell-utilities.

Inside your script file, you would add the following line to import the `shell-utilities/src/stream.sh` file...

```bash
. $HOME/scripts/shell-utilities/src/stream.sh

# Other code ...

stream::printstd "This is a successful demo!!"
```

Alternatively, you could export the full path to the `shell-utilities/src` directory in your $PATH environment variable in your shell profile.

If you know with absolute certainty that you will never move your script from the example `$HOME/scripts` directory, then you can use relative paths. However, I don't recommend that.

### Testing / Using the functions

Please refer to `shell-utilities/test` for examples of usage and output.

It is recommended to review and run the test scripts at least once before using them in your scripts.

## Docs

### stream.sh

### stream::printstd

Uses printf with a newline character. 
Explicitly directs output to STDOUT with `>&1`. 

#### Usage
Input: `stream::printstd ARGS`

Output:
```bash
ARGS

```
Note the trailing newline.

### stream::printerr

Uses printf with a newline character.
Explicitly directs output to STDERR with `>&2`.

#### Usage
Input: `stream::printstd ARGS`

Output:
```bash
ARGS

```
Note the trailing newline.
