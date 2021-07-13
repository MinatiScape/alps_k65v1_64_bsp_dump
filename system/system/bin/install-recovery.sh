#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:7cd442a95df8cba7ace61c9f03c24ed00d07b695; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:d95e1e9e99fa1c50d7d05f45a53c3b530918bb4f \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:7cd442a95df8cba7ace61c9f03c24ed00d07b695 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
