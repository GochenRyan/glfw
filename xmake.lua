target("GLFW")
    set_kind("static")
    set_languages("c")
    -- set_targetdir("$(projectdir)/libs/GLFW")
    add_headerfiles(
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h"
    )
    add_files(
        "src/context.c",
        "src/input.c",
        "src/init.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    )

    if is_plat("linux") then
        add_defines(
            "_GLFW_X11"
        )
        add_files(
            "src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/xkb_unicode.c",
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/glx_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/linux_joystick.c"
        )
    end

    if is_plat("windows") then
        add_defines(
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        )
        add_files(
            "src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
        )
    end
    set_group("Dependencies")