[![Coverage Status](https://coveralls.io/repos/github/AdrienFabre/webpages-data-sorter/badge.svg?branch=master)](https://coveralls.io/github/AdrienFabre/webpages-data-sorter?branch=master)
[![Build Status](https://travis-ci.org/AdrienFabre/webpages-data-sorter.svg?branch=master)](https://travis-ci.org/AdrienFabre/webpages-data-sorter.svg?branch=master)

# WEBPAGES DATA SORTER

This program takes a file with a list of web pages and ip and returns the ordered list of the pages with the most views, or the ordered list of the pages with the most unique views.

## Technology

Ruby

Rspec

## Requirements

### Input

```log
/help_page/1 126.318.035.038
/contact 184.123.665.067
/home 184.123.665.067
...
```

### Output

- the ordered list of the pages with the most views.
  
```md
/home 90 visits /index 80 visits etc..
```

- the ordered list of the pages with the most unique views.
  
```md
/about/2 8 unique views /index 5 unique views etc.
```

## Tests

### Run

```md
rspec
```

### Results

```md
  Display
  displays the descendant ordered list
    show the formated list
    show the formated list

User stories
  displays the descendant ordered list
    of pages with the most visits
    of pages with the most unique views

WebDataSorter
  returns the descendant ordered list
    of pages with the most visits
    of pages with the most unique views
  returns an error message
    raises an error if file is not found

Finished in 0.00549 seconds (files took 0.14562 seconds to load)
7 examples, 0 failures

Coverage report generated for RSpec to /home/adrien/Projects/ruby/webpages-data-sorter/coverage. 74 / 74 LOC (100.0%) covered.
```


## Execute Linter auto-correct

```md
bundle exec rbprettier --write '**/*.rb'
```
