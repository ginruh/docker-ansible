#!/bin/bash
# Generate ansible and ansible-core docker images
# LICENSE: MIT

# Special thanks to almalinux build script :)

# print help details
show_usage() {
    echo -e 'Generates ansible and ansible-core docker images\n'
    echo -e 'Usage build.sh [OPTION]\n'
    echo '  -h        show this message and exit' 
    echo '  -m        pip module name for ansible'
    echo '  -v        module version of specified module'
}

# build ansible docker image
build_ansible() {
    tag_name="iyorozuya/ansible:ansible_$1"
    echo "Generating $tag_name ....."
    docker build \
        -t "$tag_name" \
        --build-arg ANSIBLE_VERSION="$MODULE_VERSION" \
        -f dockerfiles/Dockerfile.ansible .
    docker push "$tag_name"
}

# build ansible-core docker image
build_ansible_core() {
    tag_name="iyorozuya/ansible:ansible-core_$1"
    echo "Generating $tag_name ....."
    docker build \
        -t "$tag_name" \
        --build-arg ANSIBLE_CORE_VERSION="$MODULE_VERSION" \
        -f dockerfiles/Dockerfile.ansible_core .
    docker push "$tag_name"
}

# build ansible base docker image
build_ansible_base() {
    PYTHON_PACKAGES=( "python38" "python39" )
    PYTHON_PIP_PACKAGES=( "python38-pip" "python39-pip" )
    for i in "${!PYTHON_PACKAGES[@]}"; do 
        python_pkg=${PYTHON_PACKAGES[i]}
        pip_pkg=${PYTHON_PIP_PACKAGES[i]}
        tag_name="iyorozuya/ansible:base-${python_pkg}"
        echo "Generating $tag_name ....."
        docker build \
            -t "$tag_name" \
            --build-arg PYTHON_PACKAGE="$python_pkg" \
            --build-arg PYTHON_PIP_PACKAGE="$pip_pkg" \
            -f dockerfiles/Dockerfile.base .
        docker push "$tag_name"
    done
}

# parse and save required params in var
while getopts "hm:v:" opt; do
    case "${opt}" in
        h)
            show_usage
            exit 0
            ;;
        m)
            MODULE_NAME="${OPTARG}"
            ;;
        v)
            MODULE_VERSION="${OPTARG}"
            ;;
        *)
            exit 1
            ;;
    esac
done

# -m and -v both are required when -m == ansible or -m == ansible-core
#  if -m == base then version is not required
if [ -z "$MODULE_NAME" ] || [ -z "$MODULE_VERSION" ]; then
    if [ -z "$MODULE_VERSION" ]; then
        if [ -z "$MODULE_NAME" ] || [[ $MODULE_NAME != "base" ]]; then
            echo "Missing -m or -v args"                   
            show_usage
            exit 1
        fi
    fi
fi

echo "Module name: $MODULE_NAME"
if ! [ -z "$MODULE_VERSION" ]; then
    echo "Module version: $MODULE_VERSION"
fi
echo ""

# handle only ansible and ansible-core module names
if [[ $MODULE_NAME == "ansible" ]]; then
    build_ansible "$MODULE_VERSION"
elif [[ $MODULE_NAME == "ansible-core" ]]; then
    build_ansible_core "$MODULE_VERSION"
elif [[ $MODULE_NAME == "base" ]]; then
    build_ansible_base
else
    echo "Unsupported module name: ${MODULE_NAME}"
    exit 1
fi
