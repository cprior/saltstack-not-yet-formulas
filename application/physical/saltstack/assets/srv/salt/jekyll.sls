ruby:
  pkg.installed
ruby-dev:
  pkg.installed
make:
  pkg.installed
gcc:
  pkg.installed
jekyll:
  gem.installed
bundler:
  gem.installed
github-pages:
  gem.installed

seems-necesary:
  cmd.run:
    - name: sudo bundle --full-index
