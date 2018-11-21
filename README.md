# packer-rhel

This project is intended to facilitate the construction of RHEL templates for:

- vagrant-libvirt with [OpenShift host preparation](https://docs.openshift.com/container-platform/3.10/install/host_preparation.html) 
- ovirt (cloud-init ready) - with [OpenShift host preparation](https://docs.openshift.com/container-platform/3.10/install/host_preparation.html)

If you encounter the following error below:
```
2015/11/02 15:52:16 packer-builder-qemu: 2015/11/02 15:52:16 Qemu stderr: Could not initialize SDL(x11 not available) - exiting
2015/11/02 15:52:16 ui error: ==> qemu: Error launching VM: Qemu failed to start. Please run with logs to get more info.
==> qemu: Error launching VM: Qemu failed to start. Please run with logs to get more info.
```

When Packer tries to start up Qemu, it tries to spin up a graphic image and since my server is headless I was getting the error above.  How to fix?

```
"builders": [{
//
//
     "qemuargs": [
        [ "-m", "4444M" ],
        [ "-nographic", "" ]
      ],
//
//
}]
```

Simply add the code above to your JSON file and everything will start swimmingly..
Source: https://jasonmarley.wordpress.com/2015/11/02/hashi-corps-packer-and-my-qemu-snafu/
