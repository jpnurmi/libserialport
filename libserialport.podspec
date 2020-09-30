Pod::Spec.new do |s|
    s.name                 = "libserialport"
    s.version              = "0.1.1"
    s.summary              = "A serial port library."
    s.description          = "A minimal, cross-platform shared library written in C that is intended to take care of the OS-specific details when writing software that uses serial ports."
    s.homepage             = "https://sigrok.org/wiki/Libserialport"
    s.license              = { :type => "LGPL-3.0", :file => "COPYING" }
    s.authors              = "See AUTHORS file"
    s.documentation_url    = "https://sigrok.org/api/libserialport/unstable/index.html"
    s.source               = { :git => "https://github.com/sigrokproject/libserialport.git", :tag => "libserialport-#{s.version}" }
    s.prepare_command      = <<-CMD
                              ((command -v automake && command -v glibtoolize) >/dev/null 2>&1 ||
                               { echo >&2 'Please run `brew install automake libtool`.'; exit 1; }) &&
                              ./autogen.sh && ./configure
                             CMD
    s.platform             = :osx
    s.source_files         = "*.{c,h}"
    s.exclude_files        = "freebsd.c", "linux*.c", "windows.c"
    s.private_header_files = "libserialport_internal.h"
    s.module_name          = "libserialport"
    s.compiler_flags       = "-DLIBSERIALPORT_ATBUILD"
    s.requires_arc         = false
    s.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)", "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" }
    s.user_target_xcconfig = { "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" }
  end
