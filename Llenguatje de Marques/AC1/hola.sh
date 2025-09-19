#!/bin/bash
for fitxer in biblioteca empresa estudiants; do xmllint --schema $fitxer.xsd --noout $fitxer.xml; done
