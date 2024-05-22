/**
 * @Author: CsVeryLoveXieWenLi
 * @Date: 2024-04-28 11:37:17
 * @LastEditors: CsVeryLoveXieWenLi
 * @LastEditTime: 2024-05-16 02:35:54
 * @Description:
 * @QQ: 1172236399
 * @Sign: 有些故事，总是美妙又缥缈，郁郁不得终。
 * @Copyright (c) 2024 by CsVeryLoveXieWenLi, All Rights Reserved.
 */

#include <napi.h>


/**
 * 初始化
 */
Napi::Object Init(Napi::Env env, Napi::Object exports) {
    // 导出
    return exports;
}

// 核心导出
NODE_API_MODULE(NODE_GYP_MODULE_NAME, Init);