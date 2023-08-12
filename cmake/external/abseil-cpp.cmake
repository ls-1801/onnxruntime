# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

find_package(absl CONFIG REQUIRED)

if (GDK_PLATFORM)
  # Abseil considers any partition that is NOT in the WINAPI_PARTITION_APP a viable platform
  # for Win32 symbolize code (which depends on dbghelp.lib); this logic should really be flipped
  # to only include partitions that are known to support it (e.g. DESKTOP). As a workaround we
  # tell Abseil to pretend we're building an APP.
  target_compile_definitions(absl_symbolize PRIVATE WINAPI_FAMILY=WINAPI_FAMILY_DESKTOP_APP)
endif()

if(NOT onnxruntime_DISABLE_ABSEIL)
  set(ABSEIL_LIBS absl::inlined_vector absl::flat_hash_set
    absl::flat_hash_map absl::node_hash_set absl::node_hash_map absl::base absl::throw_delegate absl::raw_hash_set
    absl::hash absl::city absl::low_level_hash absl::raw_logging_internal)
endif()
