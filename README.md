# Futhark Docker Image

If you would like to learn more about Futhark, please visit https://futhark-lang.org/.

## What Is This?

A Docker image containing compiled Futhark. The image is based on the official haskell image and contains only compiled Futhark binaries (in `/root/.local/bin`).

I created the image to use for local development on a CPU when working on my homework. I am not sure how this would deal with a compilation for GPU.

## How Do I Use This?

I am using bash functions/aliases such as:
```
function dockerfuthark() {
    docker run --rm -it -v $PWD:/app -w /app pavelkucera/futhark $*
}

alias futhark="dockerfuthark futhark"
alias futhark-test="dockerfuthark futhark-test"
alias futharki="dockerfuthark futharki"
alias futhark-dataset="dockerfuthark futhark-dataset"
alias futhark-bench="dockerfuthark futhark-bench"
alias futhark-c="dockerfuthark futhark-c"
alias futhark-pkg="dockerfuthark futhark-pkg"
```
