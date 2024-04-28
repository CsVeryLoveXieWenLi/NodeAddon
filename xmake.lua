--[[
Author: CsVeryLoveXieWenLi
Date: 2024-04-28 11:37:17
LastEditors: CsVeryLoveXieWenLi
LastEditTime: 2024-04-28 11:44:04
Description: OcrTools
QQ: 1172236399
Sign: 有些故事，总是美妙又缥缈，郁郁不得终。
Copyright (c) 2024 by CsVeryLoveXieWenLi, All Rights Reserved. 
--]]

-- update -> xmake project -k compile_commands


-- 模式
add_rules("mode.release")


-- 运行库
add_cxflags("/MT")


-- 头文件路径
add_includedirs("D:\\Libs\\Static\\opencv-4.9.0\\x64\\include")
add_includedirs("D:\\Libs\\Static\\ncnn-20240410\\x64\\include")
add_includedirs("D:\\Libs\\Static\\node-18.20.2\\x64\\include")
add_includedirs("D:\\Libs\\Static\\node-addon-api-8.0.0\\x64\\include")


-- 库文件路径
add_linkdirs("D:\\Libs\\Static\\opencv-4.9.0\\x64\\lib")
add_linkdirs("D:\\Libs\\Static\\ncnn-20240410\\x64\\lib")


-- opencv 库文件导入
add_links("libjpeg-turbo.lib")
add_links("libopenjp2.lib")
add_links("libpng.lib")
add_links("libwebp.lib")
add_links("opencv_core490.lib")
add_links("opencv_imgcodecs490.lib")
add_links("opencv_imgproc490.lib")
add_links("zlib.lib")


-- nodejs 库文件导入
add_links("node.lib")
add_syslinks("Advapi32")


-- ncnn 库文件导入
add_links("ncnn.lib")


-- 版本
set_languages("c17", "c++20")


-- 生成
target("OcrTools")
    set_kind("shared")
    add_files("src/*.cpp")

--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro definition
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

