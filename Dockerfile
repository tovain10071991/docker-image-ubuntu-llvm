FROM tovain10071991/ubuntu:base
MAINTAINER skyin "tovain10071991@gmail.com"
ENV REFRESHED_AT 2016-7-9:9:25
ADD llvm-3.4.src.tar.gz /home/Documents/
ADD compiler-rt-3.4.src.tar.gz /home/Documents/llvm-3.4/projects/
RUN ["mv", "/home/Documents/llvm-3.4/projects/compiler-rt-3.4", "/home/Documents/llvm-3.4/projects/compiler-rt"]
ADD clang-3.4.src.tar.gz /home/Documents/llvm-3.4/tools/
RUN ["mv", "/home/Documents/llvm-3.4/tools/clang-3.4", "/home/Documents/llvm-3.4/tools/clang"]
ADD clang-tools-extra-3.4.src.tar.gz /home/Documents/llvm-3.4/tools/clang/tools/
RUN ["mv", "/home/Documents/llvm-3.4/tools/clang/tools/clang-tools-extra-3.4", "/home/Documents/llvm-3.4/tools/clang/tools/extra"]
ADD lldb-3.4.src.tar.gz /home/Documents/llvm-3.4/tools/
RUN ["mv", "/home/Documents/llvm-3.4/tools/lldb-3.4", "/home/Documents/llvm-3.4/tools/lldb"]
VOLUME /home/Documents/llvm-3.4-install/
WORKDIR /home/Documents/llvm-3.4-build/
RUN ["../llvm-3.4/configure", "--prefix=/home/Documents/llvm-3.4-install", "--enable-cxx11", "--enable-shared", "--enable-docs", "--enable-doxygen", "--disable-optimized", "--enable-debug-runtime", "--enable-debug-symbols", "--enable-keep-symbols"]
RUN ["mv", "/home/Documents/llvm-3.4/tools/clang", "/home/Documents/llvm-3.4/tools/clang-tmp"]
RUN ["mv", "/home/Documents/llvm-3.4/tools/lldb", "/home/Documents/llvm-3.4/tools/lldb-tmp"]
RUN ["make", "-j3"]
RUN ["mv", "/home/Documents/llvm-3.4/tools/clang-tmp", "/home/Documents/llvm-3.4/tools/clang"]
RUN ["make", "-j3"]
RUN ["mv", "/home/Documents/llvm-3.4/tools/lldb-tmp", "/home/Documents/llvm-3.4/tools/lldb"]
RUN ["make", "-j3"]
