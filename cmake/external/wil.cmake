# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
set(WIL_BUILD_PACKAGING OFF CACHE BOOL "" FORCE)
set(WIL_BUILD_TESTS OFF CACHE BOOL "" FORCE)

#We can not use FetchContent_MakeAvailable(microsoft_wil) at here, since their cmake file
#always executes install command without conditions.
if(NOT wil_FOUND)
  find_package(wil CONFIG REQUIRED)
  add_library(wil ALIAS WIL::WIL)
endif()
