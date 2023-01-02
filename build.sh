#!/bin/bash
# Generate ansible and ansible-core docker images
# LICENSE: MIT

# Special thanks to almalinux build script :)

PYTHON_PACKAGES=( "python38" "python39" )
PYTHON_PIP_PACKAGES=( "python38-pip" "python39-pip" )
ANSIBLE_BASE_TAGS=( "iyorozuya/ansible:base-python38" "iyorozuya/ansible:base-python39" )
ANSIBLE_CORE_VERSIONS=( "2.12" "2.13" "2.14" )
ANSIBLE_VERSIONS=( "7.0" "7.1" )

# print help details
show_usage() {
    echo -e 'Generates ansible and ansible-core docker images\n'
    echo -e 'Usage build.sh [OPTION]\n'
    echo '  -h        show this message and exit' 
    echo '  -m        pip module name for ansible'
}

# build ansible docker image
build_ansible() {
    for i in "${!ANSIBLE_VERSIONS[@]}"; do
        version=${ANSIBLE_VERSIONS[i]}
        tag_name="iyorozuya/ansible:ansible_${version}"
        echo "Generating $tag_name ....."
        docker build \
            -t "$tag_name" \
            --build-arg ANSIBLE_BASE_IMAGE="iyorozuya/ansible:base-python39" \
            --build-arg ANSIBLE_VERSION="${version}" \
            -f dockerfiles/Dockerfile.ansible .
        docker push "$tag_name"
    done
}

# build ansible-core docker image
build_ansible_core() {
    for i in "${!ANSIBLE_CORE_VERSIONS[@]}"; do
        version=${ANSIBLE_CORE_VERSIONS[i]}
        tag_name="iyorozuya/ansible:ansible-core_${version}"
        echo "Generating $tag_name ....."
        docker build \
            -t "$tag_name" \
            --build-arg ANSIBLE_BASE_IMAGE="iyorozuya/ansible:base-python39" \
            --build-arg ANSIBLE_CORE_VERSION="${version}" \
            -f dockerfiles/Dockerfile.ansible_core .
        docker push "$tag_name"
    done
}

# build ansible base docker image
build_ansible_base() {
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
while getopts "hm:" opt; do
    case "${opt}" in
        h)
            show_usage
            exit 0
            ;;
        m)
            MODULE_NAME="${OPTARG}"
            ;;
        *)
            exit 1
            ;;
    esac
done

if [ -z "$MODULE_NAME" ]; then
    echo "Missing -m arg"
    show_usage
    exit 1
fi

echo "Module name: $MODULE_NAME"

# handle only ansible and ansible-core module names
if [[ $MODULE_NAME == "ansible" ]]; then
    build_ansible
elif [[ $MODULE_NAME == "ansible-core" ]]; then
    build_ansible_core
elif [[ $MODULE_NAME == "base" ]]; then
    build_ansible_base
else
    echo "Unsupported module name: ${MODULE_NAME}"
    exit 1
fi
