# BuildR Docker Images

This is a series of Docker images, based on the excellent [rocker/r-ver ](https://github.com/rocker-org/rocker-versioned) images, that are useful for CI builds in R projects. The general plan is that all system dependencies you might need for an R package build are already in, and you are able to install R dependencies as required. The `buildr-reticulate` image also adds an Anaconda version that is roughly contemporary with the R version.

Images are built here and pushed to Docker Hub.

## Images

![](https://github.com/mangothecat/docker-buildr/workflows/buildr/badge.svg)

| Image | Docker Hub | Description |
|:---------|:---------|:-----------------------------------------------|
|[buildr](buildr/) | [buildr](https://hub.docker.com/repository/docker/mangothecat/buildr) | Adds some system dependencies and the R remotes package. Otherwise it's plain R |
|[buildr-tidyverse](buildr-tidyverse/) |[buildr-tidyverse](https://hub.docker.com/repository/docker/mangothecat/buildr-tidyverse) | Tidyverse can take 20 minutes to build in Linux so you can have a version that already has it |
| [buildr-reticulate](buildr-reticulate/)|[buildr-reticulate](https://hub.docker.com/repository/docker/mangothecat/buildr-reticulate) | Adds Python and Conda to `buildr-tidyverse` along with reticulate |
|[buildr-rmd](buildr-rmd/) |[buildr-rmd](https://hub.docker.com/repository/docker/mangothecat/buildr-rmd) | Adds rmarkdown (and bookdown/pagedown) to `buildr-reticulate` along with Chrome for `chrome_print` |

## Add a new version

The builds happen in GitHub actions. The branch name is used everywhere as the tag. However, there is still some manual effort I haven't been able to remove.

### 1. Create a new branch

When R is upgraded and a new r-ver image is available you can make a new branch. Start from the highest branch number (or master). It should be the R version with no other characters (eg. `3.6.3`).

### 2. Up version all tags

I haven't been able to use `ARGS` as I'd like in Dockerfiles so you have to go through every docker file and bump up the tag in the top `FROM` line. eg:

```
FROM rocker/r-ver:3.6.3
```

Github actions will take care of the output tag, so long as your branch name is right.

### 3. Push branch

On pushing the new branch GitHub actions will kick in, build all the images and push them to Docker hub. You can now use the new R version. You can merge onto master if you like but don't delete the branch.
