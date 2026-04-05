<!--
SPDX-FileCopyrightText: © 2026 Ryan Carsten Schmidt <https://github.com/ryandesign>
SPDX-License-Identifier: MIT
-->

# memtracker

**memtracker** monitors the memory usage of a process and all of its child
processes. It periodically logs the number of elapsed seconds, the load average
over the past minute, and the memory usage in mebibytes of the largest
processes. At the end, it shows the elapsed seconds, the largest load average,
and the largest process over the course of the parent process's execution.

## Usage

```
usage: memtracker [-d] [-i interval] [-n numprocs] [-o outfile] [--] command [args]
```

**memtracker** cannot inspect the memory usage of processes owned by other
users. If you want to track a process started with `sudo`, start **memtracker**
with `sudo`.

## Options

* **-d**, **--debug**:
  Write new top load average and memory usage to stderr.
* **-i** *interval*, **--interval** *interval*:
  Sample the load average and memory usage every *interval* seconds. Defaults to
  5.
* **-n** *numprocs*, **--numprocs** *numprocs*:
  Record memory usage of the largest *numprocs* processes. Defaults to the
  number of active CPU cores.
* **-o** *outfile*, **--outfile** *outfile*:
  Write output to file *outfile* instead of stdout.
* **command** **[args]**:
  The command that will be run.

## Examples

```
memtracker -i 2 -n 4 make -j 4
```

```
sudo memtracker -d -o log port build qt6-qtwebengine
```

## Compatibility

**memtracker** is intended to be compatible with all versions of macOS that have
`/usr/bin/footprint`, the program used to collect the memory usage information.
If `footprint` is not found, the process is run without tracking.

## License

**memtracker** is released under the MIT license.
