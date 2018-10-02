# Futhark

If you would like to learn more about Futhark, please visit https://futhark-lang.org/.

## What is this?

A Docker image containing compiled Futhark. The image is based on the official haskell image and contains only compiled binaries (in `/root/.local/bin`)

I created the image to use for local development on a CPU. I am not sure how this would deal with a compilation for GPU.

## How do I use it?

I am using bash aliases such as:
```
alias dockerfuthark="docker run --rm -it -v $PWD:/app -w /app pavelkucera/futhark"
alias futharki="dockerfuthark futharki"
alias futhark-test="dockerfuthark futhark-test"
```