#!/bin/bash -e

# save to an ext4 partition named BackupLuc
# sudo e2label /dev/sda2 BackupLuc
# -> automatically mounted in /media/luc/BackupLuc

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

BACKUPDIR=$HOME/.luc/backup

TIMESTAMPFILE="$BACKUPDIR/last_"`basename $0`

LOG="$BACKUPDIR/log/rsync.out"
LOGERR="$BACKUPDIR/log/rsync.err"

# Backup /
BACKUP_SRC="/"
BACKUP_DEST="/media/luc/BackupLuc"
BACKUP_MSG="backup ${BACKUP_SRC} => ${BACKUP_DEST}"

if [[ `mount | grep ${BACKUP_DEST} | wc -l` = 0 ]]; then
	PRINT_ERROR "Please plug USB backup drive"
	exit
fi

PRINT "Starting ${BACKUP_MSG}"
PRINT "Logs:"
PRINT "  $LOG"
PRINT "  $LOGERR"
$SUDO rsync -axHAWXSvi --info=progress2 --exclude-from=$BACKUPDIR/rsyncExclusionsRootfs --delete-before ${BACKUP_SRC} ${BACKUP_DEST} > >(tee $LOG) 2>$LOGERR && PRINT "[OK] ${BACKUP_MSG}" || (tail $LOGERR && PRINT_ERROR "[ko] ${BACKUP_MSG}" && echo "less  $LOGERR")
$SUDO chown luc.luc $LOG $LOGERR

if [ "$(( $(date +"%s") - $(stat -c "%Y" ${TIMESTAMPFILE}) ))" -gt "3600" ]; then
# if test `find "${TIMESTAMPFILE}" -mmin +120`
    # echo "${TIMESTAMPFILE} is older then 1 hours"

	# Update file installedDebsPerRepository.txt
	PRINT "Update $BACKUPDIR/dpkg/installedDebsPerRepository.txt"
	$BACKUPDIR/scripts/installedPackagesPerRepository.py > $BACKUPDIR/dpkg/installedDebsPerRepository.txt

	# Update file installedDebs.txt
	PRINT "Update $BACKUPDIR/dpkg/installedDebs.txt"
	echo '# To reinstall all debs: ' > $BACKUPDIR/dpkg/installedDebs.txt
	echo -e '# dpkg --set-selections < installedDebs.txt && dselect && apt-get dselect-upgrade\n' > $BACKUPDIR/dpkg/installedDebs.txt
	dpkg --get-selections > $BACKUPDIR/dpkg/installedDebs.txt
	touch ${TIMESTAMPFILE}
fi

FSTAB_BACKUP=$(sudo blkid | grep /dev/sda2 | awk -F\"  '{print $4;}' | awk -F- '{print $1;}')
if [ "$FSTAB_BACKUP" = "d5858e1d" ]; then
	# copy fstab to mount the backuped / if transcend USB only
	$SUDO mv ${BACKUP_DEST}/etc/fstab ${BACKUP_DEST}/etc/fstab.backup
	PRINT "cp $BACKUPDIR/fstab.backupUSB_${FSTAB_BACKUP} ${BACKUP_DEST}/etc/fstab"
	$SUDO cp $BACKUPDIR/fstab.backupUSB_${FSTAB_BACKUP} ${BACKUP_DEST}/etc/fstab
	$SUDO chown root.root ${BACKUP_DEST}/etc/fstab
fi

# Backup /home
BACKUP_SRC="/home"
BACKUP_MSG="backup ${BACKUP_SRC} => ${BACKUP_DEST}"
PRINT "Starting ${BACKUP_MSG}"
$SUDO rsync -axHAWXSvi -b --backup-dir=${BACKUP_DEST}/home/luc/deleted --exclude-from=$BACKUPDIR/rsyncExclusionsHome --delete-before --info=progress2 ${BACKUP_SRC} ${BACKUP_DEST} > >(tee $LOG) 2>$LOGERR && PRINT "[OK] ${BACKUP_MSG}" || (tail $LOGERR && PRINT_ERROR "[ko] ${BACKUP_MSG}" && echo "less  $LOGERR")
$SUDO chown luc.luc $LOG $LOGERR

echo `date +%c` > $TIMESTAMPFILE

PRINT "unmounting ${BACKUP_DEST}"
$SUDO umount ${BACKUP_DEST}