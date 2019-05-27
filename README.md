# Charlie Cloud Binaries on PyPI

Install [Charliecloud](https://hpc.github.io/charliecloud/) binaries
with `pip`!

## Installation

Instead of following the (fairly simple) [install instructions]
(https://hpc.github.io/charliecloud/install.html#manual-build-and-install),
you can instead install Charliecloud into your `virtualenv` or
`conda` environment with:

```bash
pip install charliecloud-bin
```
This only workd on Linux, and you'll get binary wheels.

## Usage

Installation puts the appropriate binaries in your $PATH
automatically (assuming you are in a venv or conda env),
so you can go [follow the tutorial](https://hpc.github.io/charliecloud/tutorial.html)
or use it in any other way you wish.

## Versioning

Currently, the versioning scheme is `<Charliecloud version>a<somenumber>`,
where I increment the second number as I try out releases.

## Questions you might have

### Why?

1. Because you can
2. Unlike `apt`, `dnf`, etc. users can use `pip` without
   root.
3. If you can use `conda` for this why not `pip`?
4. When building other python projects that want to use
   Charliecloud, it is *much* easier to depend on a python
   package like this than expect users to have a local install
   of a version we like.

(4) is really the real reason.

### You lie about this wheel being manylinux1!

Yes I do. This package is distributed as a wheel that
claims to be conformant to [manylinux1](https://www.python.org/dev/peps/pep-0513/).
It claims to work with the glibc that shipped in *CentOS 5*,
which was released in *2007*. It very most definitely does not!

It's a convenient lie to be able to get on PyPI. The binaries
would error out on runtime. The alternative would be to have
an sdist that errors out on build time. Possibly that's better?
But I'm lazy and this works. Maybe I should switch.

### This Charliecloud thing seems cool, where can I learn more?

Glad you asked!

1. Their [documentation](https://hpc.github.io/charliecloud) is
   pretty good
2. This [talk](https://www.usenix.org/conference/lisa17/conference-program/presentation/jennings)
   is also pretty good!
