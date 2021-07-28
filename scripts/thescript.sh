#!/bin/bash
echo creating temporary image...
mv LM-pers.img temp.img

echo converting image ...
dd if=temp.img | tr '\000' '\377' > LM-pers.img

echo deleting temp image...
rm temp.img

freeloop=$(losetup -f)
echo mounting image...
losetup $freeloop LM-pers.img

echo formatting image...
mkfs.ext4 -E nodiscard -L "casper-rw" $freeloop
echo syncing changes...
sync
echo unmounting image...
losetup -d $freeloop
echo "all done! completed succesfully so now Jeff go back to Windows and copy the file to the pers folder"
exit 0

