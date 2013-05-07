#!/bin/sh

# Little hacky script for adding NCBI taxa to an OWL ontology

# Get the latest dumps

echo "Update dumps? yes (y) or no (n)"

read update

if [ $update = "y" ]; then
  rm taxdump.tar.gz
  wget ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz
  tar -xvzf taxdump.tar.gz
fi

# Execute the converter
java -jar ncbi2owl.jar names.dmp nodes.dmp PPIO.owl PPIO.owl ncbi_taxa_ids
