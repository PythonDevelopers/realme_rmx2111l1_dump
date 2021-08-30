#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:c36e0de491070d7ccf91958e4a18c6b850a19e32; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:33554432:64bc70190eaa6b3363830a7edce42b38f6c464d8 \
          --target EMMC:/dev/block/by-name/recovery:134217728:c36e0de491070d7ccf91958e4a18c6b850a19e32 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
