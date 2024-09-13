bjorn_sh_file="$1"

echo -e "spring_file\tfilesize_on_backup\tfilesize_restored"

cat $bjorn_sh_file | grep restored | cut -f 2,6 -d " " | while IFS=" " read -r bkp restored;
do
    spring_file="$(basename $bkp)"
    restored_size=$(ls -l $restored | awk '{print $5}');
    bkp_size=$(ls -l $bkp | awk '{print $5}');
    echo -e "$spring_file\t$bkp_size\t$restored_size"
done
