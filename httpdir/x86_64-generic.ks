lang en_US
keyboard us
timezone America/Fortaleza --isUtc
reboot
text
cdrom
# user: root
# pwd.: admin12345
auth --passalgo=sha512 --useshadow
rootpw --iscrypted $6$D1vGxIly32NpFZ7k$judD8zn9CRdtz7.M0Kb2Ll7dHipJYUaZK54S1FDsz9YGyJcobU4vW5JZl6pjR7Q7N78DjuIeEPO2ajH9kUapP1
bootloader --location=mbr --append="rhgb quiet crashkernel=auto"
zerombr
clearpart --all --initlabel --drives=vda
part /boot --fstype=ext4 --size=250
volgroup vg_local pv.0 
part pv.0 --fstype=lvmpv --ondisk=vda --size=1024 --grow
logvol swap --recommended --vgname=vg_local --name=lv_swap
logvol / --vgname=vg_local --name=lv_root --fstype=xfs --size=20480
auth --passalgo=sha512 --useshadow
selinux --enforcing
firewall --enabled
skipx
%packages
cloud-init
%end
%post
touch /etc/cloud/cloud-init.disabled
%end
