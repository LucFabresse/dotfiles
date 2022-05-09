#!/bin/bash -e

YELLOW="\e[1;93m"
GREEN="\e[32m"
RED="\e[1;31m"
WHITE="\e[0;37m"

function PRINT() {
	echo -e "${GREEN}$@${WHITE}"
}

function PRINT_ERROR() {
	echo -e "${RED}$@${WHITE}"
}

SUDO='sudo'
# if (( $EUID != 0 )); then
#     SUDO='sudo'
# fi

BACKUPDIR=/tmp

LOG="$BACKUPDIR/rsync.out"
LOGERR="$BACKUPDIR/rsync.err"

# Backup /
BACKUP_SRC="/"
BACKUP_DEST="/mnt/root/@"
BACKUP_MSG="backup ${BACKUP_SRC} => ${BACKUP_DEST}"
PRINT "Starting ${BACKUP_MSG}"
# if [[ `mount | grep ${BACKUP_DEST} | wc -l` = 0 ]]; then
# 	PRINT "Mounting ${BACKUP_DEST}"
# 	$SUDO mount ${BACKUP_DEST}
# 	sleep 2
# fi

$SUDO rsync -axHAWXSvi --info=progress2 --exclude-from=rsyncExclusionsRootfs ${BACKUP_SRC} ${BACKUP_DEST} > >(tee $LOG) 2>$LOGERR && PRINT "[OK] ${BACKUP_MSG}" || (tail $LOGERR && PRINT_ERROR "[ko] ${BACKUP_MSG}" && echo "less  $LOGERR")
$SUDO chown luc.luc $LOG $LOGERR

# Put fstab to mount the backup /
$SUDO mv ${BACKUP_DEST}/etc/fstab ${BACKUP_DEST}/etc/fstab.backup
$SUDO cp $BACKUPDIR/fstab.backupRootfs ${BACKUP_DEST}/etc/fstab
$SUDO chown root.root ${BACKUP_DEST}/etc/fstab

echo `date +%c` > "$BACKUPDIR/last_"`basename $0`

PRINT "unmounting ${BACKUP_DEST}"
$SUDO umount ${BACKUP_DEST}


# sudo rsync -axHAWXSvi --info=progress2 --exclude-from=rsyncExclusionsRootfs / /mnt/root/@
# edit /etc/fstab
