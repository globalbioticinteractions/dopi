[![GloBI Review by Elton](../../actions/workflows/review.yml/badge.svg)](../../actions/workflows/review.yml) [![GloBI](https://api.globalbioticinteractions.org/interaction.svg?accordingTo=globi:globalbioticinteractions/dopi)](https://globalbioticinteractions.org/?accordingTo=globi:globalbioticinteractions/dopi) 

Configuration to help Global Biotic Interactions (GloBI, https://globalbioticinteractions.org) index:

> Nick Balfour, Maria Clara Castellanos, Chris Johnson, Dave Goulson, Andrew Philippides. 2023. The Database of Pollinator Interactions (DoPI). Accessed at https://www.sussex.ac.uk/lifesci/ebe/dopi/ on 2023-12-01.
> 
> "The Database of Pollinator Interactions (DoPI) documents British pollinator-plant associations. DoPI unites the disparate publications currently scattered throughout the scientific literature with unpublished reports and databases into a single online depository." - https://www.sussex.ac.uk/lifesci/ebe/dopi/ accessed at 2023-12-01 
> 

## Methods

run 

```
./make.sh
```

using a bash terminal with jq, curl, mlr, sed, and tr installed.

If all goes well, the script will produce (or update):

```dopi.txt``` - text produced by DoPI website to generate the main index of plant-pollinator interactions
```interactions.tsv``` - a tab-separated table derived from dopi.txt 

:warning: Note this this information contains only a fraction of the wealth of data contained by DoPI. Please refer to the website to find ways to access this data. 
