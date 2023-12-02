#!/bin/bash
#
# Script to retrieve the summary table of DoPI index of species interactions
# 2023-12-01
#

retrieve() {
  curl 'https://www.sussex.ac.uk/lifesci/ebe/dopi/ajax/search' --data-raw 'action=%22results%22&searchoptions=%5B%22yearsfrom--1867%22%2C%22yearsto--2019%22%5D'\
  > dopi.txt
}

retrieve

cat\
 <(echo -e "sourceTaxonId\tsourceTaxonName\ttargetTaxonId\ttargetTaxonName\treferenceUrl\tnumberOfInteractions\tinteractionTypeId\tinteractionTypeName")\
 <(cat dopi.txt\
 | sed 's/\\n/\n/g'\
 | sed 's/\\"/"/g'\
 | sed 's+\\/+/+g'\
 | sed 's+"<table>+<table>+g'\
 | sed 's+<th>.*++g'\
 | sed 's+^"$++g'\
 | sed 's+<tr>+[+g'\
 | sed 's+</tr>+],+g'\
 | sed 's+</a></td>+"+g'\
 | sed 's+<td><a href=++g'\
 | sed 's+<td>.*</td>++g'\
 | sed 's+ target="_blank">+, "+g'\
 | tail -n+4\
 | tr -d '\n'\
 | sed 's+""+","+g'\
 | sed 's+,</table>$+]+g'\
 | sed 's+^],+[+g'\
 | sed 's+#overview++g'\
 | sed 's+search+https://www.sussex.ac.uk/lifesci/ebe/dopi/search+g'\
 | jq --raw-output '.[] | @tsv'\
 | sed 's+$+\thttp://purl.obolibrary.org/obo/RO_0002456\tpollinated by+g')\
 | mlr --tsvlite reorder -f sourceTaxonId,sourceTaxonName,interactionTypeId,interactionTypeName,targetTaxonName,targetTaxonId,targetTaxonName,numberOfInteractions,referenceUrl\
 | tee interactions.tsv
