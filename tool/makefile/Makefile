# ****************************** 配置区（用户可修改）******************************
# 可执行文件名称（必填）
TARGET := test

# 源代码根目录（默认当前目录）
SRC_ROOT := .

# C头文件所在目录（默认与源文件同目录，可指定如src/c_headers）
C_HEADER_DIRS := $(SRC_ROOT)

# 编译输出目录
BUILD_DIR := build
BIN_DIR := $(BUILD_DIR)/bin
OBJ_DIR := $(BUILD_DIR)/obj
# 临时头文件目录（存放添加extern "C"后的C头文件副本）
TMP_HEADER_DIR := $(BUILD_DIR)/tmp_headers

# C标准（C工程用）
C_STD := c11

# C++标准（C++工程用）
CXX_STD := c++17

# C编译选项
CFLAGS := -Wall -Wextra -O2 -g

# C++编译选项
CXXFLAGS := -Wall -Wextra -O2 -g

# 链接选项（C++可能需要-lstdc++，根据需要添加）
LDFLAGS := 

# 额外头文件搜索路径（原始头文件目录，如-I./include）
INCLUDES := 
# *********************************************************************************


# -------------------------- 自动识别与预处理（无需修改）--------------------------
# 定义源文件类型
C_SRC_EXT := .c
CXX_SRC_EXT := .cpp .cc

# 递归查找所有C和C++源文件
C_SRCS := $(shell find $(SRC_ROOT) -type f -name "*$(C_SRC_EXT)")
CXX_SRCS := $(foreach ext,$(CXX_SRC_EXT),$(shell find $(SRC_ROOT) -type f -name "*$(ext)"))
ALL_SRCS := $(C_SRCS) $(CXX_SRCS)

# 检查源文件是否存在
ifneq ($(ALL_SRCS),)
    # 识别工程类型（有C++文件则视为C++工程，兼容C）
    ifneq ($(CXX_SRCS),)
        PROJECT_TYPE := c++
        COMPILER := g++
        FINAL_CFLAGS := $(CXXFLAGS) -std=$(CXX_STD) $(INCLUDES)
    else
        PROJECT_TYPE := c
        COMPILER := gcc
        FINAL_CFLAGS := $(CFLAGS) -std=$(C_STD) $(INCLUDES)
    endif
else
    $(error 错误：未找到任何源文件（.c/.cpp/.cc），请检查SRC_ROOT路径)
endif

# 收集所有C头文件（.h），后续自动添加extern "C"
C_HEADERS := $(shell find $(C_HEADER_DIRS) -type f -name "*.h")

# 生成临时头文件路径（原始头文件→临时目录，保留目录结构）
# 例：src/c_header.h → build/tmp_headers/src/c_header.h
TMP_HEADERS := $(patsubst %,$(TMP_HEADER_DIR)/%,$(C_HEADERS))

# 生成目标文件路径
OBJS := $(patsubst %,$(OBJ_DIR)/%,$(addsuffix .o,$(basename $(ALL_SRCS))))

# 可执行文件路径
TARGET_PATH := $(BIN_DIR)/$(TARGET)

# 编译时优先搜索临时头文件目录（确保C头文件用处理后的版本）
FINAL_CFLAGS += -I$(TMP_HEADER_DIR)
# --------------------------------------------------------------------------------


# 默认目标：预处理头文件→编译→链接
all: $(TARGET_PATH)
	@echo "编译完成！工程类型：$(PROJECT_TYPE)，可执行文件：$(TARGET_PATH)"
	@cp $(TARGET_PATH) ./


# 链接生成可执行文件
$(TARGET_PATH): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(COMPILER) $(OBJS) -o $@ $(LDFLAGS)
	@echo "链接完成：$@"


# 编译C源文件（依赖临时头文件）
$(OBJ_DIR)/%.o: %.c $(TMP_HEADERS)
	@mkdir -p $(dir $@)
	$(COMPILER) $(FINAL_CFLAGS) -c $< -o $@
	@echo "编译C文件：$< → $@"


# 编译C++源文件（依赖临时头文件）
$(OBJ_DIR)/%.o: %.cpp $(TMP_HEADERS)
	@mkdir -p $(dir $@)
	$(COMPILER) $(FINAL_CFLAGS) -c $< -o $@
	@echo "编译C++文件：$< → $@"

$(OBJ_DIR)/%.o: %.cc $(TMP_HEADERS)
	@mkdir -p $(dir $@)
	$(COMPILER) $(FINAL_CFLAGS) -c $< -o $@
	@echo "编译C++文件：$< → $@"


# 预处理C头文件：自动添加extern "C"包裹（不修改原始文件）
# 规则：如果头文件未包含extern "C"，则添加；已包含则跳过
$(TMP_HEADER_DIR)/%.h: %.h
	@mkdir -p $(dir $@)
	# 检查头文件是否已有extern "C"包裹
	if ! grep -qE "^#ifdef __cplusplus.*extern \"C\" \{.*#endif" "$<" >/dev/null 2>&1; then \
		# 先复制原始内容到临时文件
		cp "$<" "$@"; \
		# 开头添加：#ifdef __cplusplus + extern "C" { + #endif
		sed -i '1i #ifdef __cplusplus\nextern "C" {\n#endif' "$@"; \
		# 结尾添加：#ifdef __cplusplus + } + #endif
		echo -e "\n#ifdef __cplusplus\n}" >> "$@"; \
		echo "已为C头文件添加extern \"C\": $< → $@"; \
	else \
		# 已有extern "C"，直接复制
		cp "$<" "$@"; \
		echo "C头文件已包含extern \"C\"，直接复制：$< → $@"; \
	fi


# 清理所有编译产物（包括临时头文件）
clean:
	@if [ -d $(BUILD_DIR) ]; then \
		rm -rf $(BUILD_DIR); \
		echo "已清理：$(BUILD_DIR)"; \
	else \
		echo "无文件可清理"; \
	fi


# 伪目标
.PHONY: all clean

