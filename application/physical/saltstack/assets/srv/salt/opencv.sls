#sudo salt 'T530-2017' state.apply opencv
#http://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/
#http://docs.opencv.org/3.2.0/d7/d9f/tutorial_linux_install.html

{% for item in ['build-essential', 'cmake', 'git', 'pkg-config', 'unzip', 'ffmpeg', 'qtbase5-dev', 'python-dev', 'python3-dev', 'python-numpy', 'python3-numpy', 'libopencv-dev', 'libgtk-3-dev', 'libdc1394-22', 'libdc1394-22-dev', 'libjpeg-dev', 'libpng12-dev', 'libtiff5-dev', 'libjasper-dev', 'libavcodec-dev', 'libavformat-dev', 'libswscale-dev', 'libxine2-dev', 'libgstreamer0.10-dev', 'libgstreamer-plugins-base0.10-dev', 'libv4l-dev', 'libtbb-dev', 'libfaac-dev', 'libmp3lame-dev', 'libopencore-amrnb-dev', 'libopencore-amrwb-dev', 'libtheora-dev', 'libvorbis-dev', 'libxvidcore-dev', 'v4l-utils',  'libeigen3-dev', 'libwebp-dev', 'libopenexr-dev', 'libgdal-dev'] %}
{{ item }}:
  pkg.installed
{% endfor %}


opencv archive:
  file.managed:
    - skip_verify: true
    - name: /tmp/opencv-archive-3.2.0.zip
    - source: https://github.com/opencv/opencv/archive/3.2.0.zip
opencv_contrib archive:
  file.managed:
    - skip_verify: true
    - name: /tmp/opencv_contrib-archive-3.2.0.zip
    - source: https://github.com/Itseez/opencv_contrib/archive/3.2.0.zip
unzip-opencv-3.2.0:
  cmd.run:
    - name: |
        cd /tmp
        unzip -o -qq opencv-archive-3.2.0.zip
unzip-opencv_contrib-3.2.0:
  cmd.run:
    - name: |
        cd /tmp
        unzip -o -qq opencv_contrib-archive-3.2.0.zip

numpy:
  pip.installed:
    - bin_env: '/usr/bin/pip3'
scikit-image:
  pip.installed:
    - bin_env: '/usr/bin/pip3'

install-opencv-3.2.0:
  cmd.run:
    - name: |
        cd /tmp
        wget -q -c https://github.com/opencv/opencv/archive/3.2.0.zip
        unzip -o -qq 3.2.0.zip
        cd opencv-3.2.0
        mkdir build && cd build
        cmake -D CMAKE_BUILD_TYPE=RELEASE -D INSTALL_PYTHON_EXAMPLES=ON -D PYTHON_EXECUTABLE=/usr/bin/python3 -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib-3.2.0/modules -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_CUBLAS=ON -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES" -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..  
        make -j $(($(nproc) + 1))
        make install
        cp /usr/local/lib/python3.5/dist-packages/cv2.cpython-35m-x86_64-linux-gnu.so /usr/local/lib/python3.5/dist-packages/cv2.so
        /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
        ldconfig
        cd /tmp
        rm -rf /tmp/opencv-3.2.0/build
    - output_loglevel: quiet
    - cwd: /tmp
    - shell: /bin/bash
    - timeout: 300
    - unless: test -x /usr/local/lib/python3.5/dist-packages/cv2.cpython-35m-x86_64-linux-gnu.so


