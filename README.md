# Generic Docker build container for DEB packages

## Usage

This container will build Debian Stretch `.deb` Packages from a repository containing a `debian/` directory.

To build a package, the container needs to run with two volumes `/input` and `/output`. `/input` has to contain the source of the package to build, finished packages will be copied to `/output`.

```bash
docker run --rm -v $PWD/source:/input -v $PWD/packages:/output markuslindenberg/debuilder
```

