#!/bin/bash

# Read the key names of the YAML into a vector
keys=$(awk -F: '{print $1}' data/colors.yaml)
IFS=$'\n' read -rd '' karray <<<"$keys" 
workdir=exampleSite
mkdir -p ${workdir}/public/theme

for key in ${karray}; do
  echo $key
  # Replace design value with the current key
  cat ${workdir}/hugo.toml | sed -e s/icicle/${key}/g > ${workdir}/hugo_${key}.toml

done

# Read the YAML file line by line
while IFS= read -r line
do
    # Check if line has a key-value format
    if [[ "$line" =~ ^[[:space:]]*[^[:space:]#]+:[[:space:]]* ]]
    then
        # Extract the key (part before the ':')
        key=$(echo $line | cut -d ':' -f 1 | xargs) # xargs is used to trim leading/trailing whitespaces
        karray+=("$key") # Append to the array
    fi
done < data/colors.yaml 

workdir=exampleSite
mkdir -p ${workdir}/public/theme

for key in "${karray[@]}"; do
    echo $key
    # Replace design value with the current key
    cat ${workdir}/hugo.toml | sed -e s/icicle/${key}/g > ${workdir}/hugo_${key}.toml

    # Build Hugo website and output into its own folder within public/themes/key
    cd ${workdir} && \ 
        hugo \
            --config ${workdir}/hugo_${key}.toml \
            --themesDir ../.. \
            --destination ${workdir}/public/theme/${key}
    cd -
done
