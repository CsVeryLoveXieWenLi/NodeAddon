﻿--[[
Author: CsVeryLoveXieWenLi
Date: 2024-05-05 14:25:09
LastEditors: CsVeryLoveXieWenLi
LastEditTime: 2024-05-16 02:16:58
Description: demo
QQ: 1172236399
Sign: 有些故事，总是美妙又缥缈，郁郁不得终。
Copyright (c) 2024 by CsVeryLoveXieWenLi, All Rights Reserved. 
--]]

-- update -> xmake project -k compile_commands


-- 模式
add_rules("mode.release")


-- 头文件路径
if is_os("linux") then
    add_includedirs("/root/Libs/Static/opencv-4.10.0/x64/include")
    add_includedirs("/root/Libs/Static/node-18.20.2/x64/include")
    add_includedirs("/root/Libs/Static/node-addon-api-8.0.0/x64/include")

elseif is_os("windows") then
    add_includedirs("D:\\Libs\\Static\\opencv-4.10.0\\x64\\include")
    add_includedirs("D:\\Libs\\Static\\ncnn-20240410\\x64\\include")
    add_includedirs("D:\\Libs\\Static\\node-18.20.2\\x64\\include")
    add_includedirs("D:\\Libs\\Static\\onnxruntime-1.17.3\\x64\\include")
    add_includedirs("D:\\Libs\\Static\\node-addon-api-8.0.0\\x64\\include")
end


-- 库文件路径
if is_os("linux") then
    add_linkdirs("/root/Libs/Static/opencv-4.10.0/x64/lib")
    add_linkdirs("/root/Libs/Share/jpeg-9f/x64/lib")
    add_linkdirs("/root/Libs/Share/libpng-1.6.43/x64/lib")

elseif is_os("windows") then
    add_linkdirs("D:\\Libs\\Static\\node-18.20.2\\x64\\lib")
    add_linkdirs("D:\\Libs\\Static\\opencv-4.10.0\\x64\\lib")
    add_linkdirs("D:\\Libs\\Static\\onnxruntime-1.17.3\\x64\\lib")
    add_linkdirs("D:\\Libs\\Static\\ncnn-20240410\\x64\\lib")
end


-- 库文件导入
if is_os("linux") then
    -- Jpeg
    add_links("jpeg")
    
    -- Png
    add_links("png")

    -- Opencv
    add_links("zlib")
    add_links("libjpeg-turbo")
    add_links("libopenjp2")
    add_links("libpng")
    add_links("opencv_imgcodecs")
    add_links("opencv_imgproc")
    add_links("opencv_core")
    add_links("libwebp")

    -- Pthread
    add_links("pthread")
    
elseif is_os("windows") then
    -- NodeJs
    add_links("node.lib")

    -- Opencv
    add_links("libjpeg-turbo.lib")
    add_links("libopenjp2.lib")
    add_links("libpng.lib")
    add_links("libwebp.lib")
    add_links("opencv_core490.lib")
    add_links("opencv_imgcodecs490.lib")
    add_links("opencv_imgproc490.lib")
    add_links("zlib.lib")

    -- Onnxruntime
    add_links("onnxruntime.lib")

    -- Ncnn
    add_links("ncnn.lib")

    -- SystemApi
    add_syslinks("Advapi32")
end


-- 语言版本
set_languages("clatest", "c++20")


-- 任务配置
target("demo")
    set_kind("shared")
    add_files("src/*.cpp")

    set_strip("all")
    set_filename("demo.node")


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

