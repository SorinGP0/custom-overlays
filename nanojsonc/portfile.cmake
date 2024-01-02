vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO saadshams/nanojsonc
    REF "${VERSION}"
    SHA512 cf037c8a01a4c17e454a47c5c8d09bcebad559a7daaa3b5c4b40e5f5b660ee39277b30be485f237a781e2d3a90bbfa4ce8fc651cc2a502a9c9470a2c6ec7d2fd
    HEAD_REF nanojsonc
)


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "nanojsonc")

#vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/nanojsoncTargets")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)