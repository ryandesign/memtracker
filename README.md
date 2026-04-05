<!--
SPDX-FileCopyrightText: © 2026 Ryan Carsten Schmidt <https://github.com/ryandesign>
SPDX-License-Identifier: MIT
-->

# memtracker

## Synopsis

```
memtracker [-d] [-i interval] [-n numprocs] [-o outfile] [--] command [args]
```

## Description

**memtracker** monitors the memory usage of a process and all of its child
processes. It periodically logs the number of elapsed seconds, the load average
over the past minute, and the memory usage in mebibytes of the largest
processes. At the end, it shows the elapsed seconds, the largest load average,
and the largest process over the course of the parent process's execution.

**memtracker** cannot inspect the memory usage of processes owned by other
users. If you want to track a process started with `sudo`, start **memtracker**
with `sudo`.

## Options

<dl>
<dt>-d, --debug:</dt>
<dd>Write new top load average and memory usage to stderr.</dd>
<dt>-i interval, --interval interval:</dt>
<dd>Sample the load average and memory usage every <em>interval</em> seconds.
Defaults to 5.</dd>
<dt>-n numprocs, --numprocs numprocs:</dt>
<dd>Record memory usage of the largest <em>numprocs</em> processes. Defaults to
the number of active CPU cores.</dd>
<dt>-o outfile, --outfile outfile:</dt>
<dd>Write output to file <em>outfile</em> instead of stdout.</dd>
<dt>command [args]:</dt>
<dd>The command that will be run.</dd>
</dl>

## Examples

```
memtracker -i 2 -n 4 make -j 4
```

```
sudo memtracker -d -o log port build qt6-qtwebengine
```

## Compatibility

**memtracker** is intended to be compatible with macOS 10.9 and later. Earlier
versions do not have `/usr/bin/footprint`, the program used to collect the
memory usage information. If `footprint` is not found, the process is run
without tracking.

## License

**memtracker** is released under the MIT license.
