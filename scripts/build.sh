#!/bin/bash
# Generate ansible and ansible-core docker images
# LICENSE: MIT

# Special thanks to almalinux build script :)

show_usage() {
    echo -e 'Generates ansible and ansible-core docker images\n'
    echo -e 'Usage build.sh [OPTION]\n'
    echo '  -h        show this message and exit' 
    echo '  -m        pip module name for ansible'
    echo '  -v        module version of specified module'
}

while getopts "hm:v:" opt; do
    case "${opt}" in
        h)
            show_usage
            exit 0
            ;;
        m)
            MODULE="${OPTARG}"
            ;;
        v)
            MODULE_VERSION="${OPTARG}"
            ;;
        *)
            exit 1
            ;;
    esac
done

echo $MODULE
echo $MODULE_VERSION