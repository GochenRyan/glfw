target("libGLFW")
    set_kind("static")
    add_headerfiles(
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h"
    )
    add_files(
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/null_init.c",
        "src/null_joystick.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/platform.c",
        "src/vulkan.c",
        "src/window.c"
    )

    if is_plat("windows") then
        add_defines(
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        )
        add_files(
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_module.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        )
        add_syslinks("opengl32", "gdi32", "user32", "kernel32", "shell32")
    end

    set_group("Vendor")